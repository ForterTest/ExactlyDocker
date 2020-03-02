Vue.component('login-button', {
    methods: {
        logIn: () => {
            var params = [
                'client_id=3',
                'redirect_uri='+encodeURIComponent('http://127.0.0.1:88/callback.php'),
                'response_type=code',
            ];
            window.open(
                "http://127.0.0.1/oauth/authorize?"+params.join('&'),
                "oauth",
                "toolbar=no,menubar=no,width=500,height=440,top=100,left=100"
            );
        },
    },
    template: '<button class="btn btn-primary" v-on:click="logIn">Login</button>'
});

new Vue({
    el: '#app',
    data: {
        api_url: 'http://127.0.0.1/api',
        api_headers: { 'Authorization': 'Bearer ' + access_token },

        logged_in: logged_in,
        recipients: [],
        current_user: {
            'id': 0,
            'name': '',
            'balance_in_minor_units': 0
        },
        history: [],
        send: {
            uid: 0,
            amount: ""
        },
        multi_send: [
            {
                uid: 0,
                amount: ""
            },
            {
                uid: 0,
                amount: ""
            }
        ]
    },
    created: function () {
        if (!this.logged_in) {
            return;
        }

        this.loadCurrentUser();
        this.loadHistory();
        this.loadRecipients();
        this.initAutoRefresh();
    },
    computed: {
        userBalance: function () {
            return this.current_user.balance_in_minor_units.toFixed(2);
        }
    },
    methods: {
        sendToUser: function () {
            $.ajax(this.api_url + '/send_to_user', {
                method: 'post',
                headers: this.api_headers,
                dataType: 'json',
                data: this.send,
                success: (response) => {
                    this.loadCurrentUser();
                    this.loadHistory();
                    this.send = {
                        uid: 0,
                        amount: ""
                    };
                },
                error: (response) => {
                    this.handleServerError(response);
                }
            });
        },
        sendToUsers: function () {
            $.ajax(this.api_url + '/send_to_users', {
                method: 'post',
                headers: this.api_headers,
                dataType: 'json',
                data: { operations: JSON.stringify(this.multi_send) },
                success: (response) => {
                    this.loadCurrentUser();
                    this.loadHistory();
                    this.multi_send = [
                        {
                            uid: 0,
                            amount: ""
                        },
                        {
                            uid: 0,
                            amount: ""
                        }
                    ];
                },
                error: (response) => {
                    this.handleServerError(response);
                }
            });
        },
        addRecipient: function () {
            this.multi_send.push({
                uid: 0,
                amount: ""
            });
        },
        getBalance: function () {
            return this.current_user.balance.toFixed(2);
        },
        handleServerError: function (response) {
            if (typeof response.status != 'undefined' && response.status == 401) {
                // Unathorized
                window.location.assign("/");
            }

            if (typeof response.responseJSON != 'undefined') {
                alert(response.responseJSON.msg);
            }
        },
        loadCurrentUser: function () {
            $.ajax(this.api_url + '/users/current', {
                method: 'get',
                headers: this.api_headers,
                dataType: 'json',
                success: (response) => {
                    if (this.current_user.balance_in_minor_units != response.balance_in_minor_units) {
                        this.current_user = response;
                        this.loadHistory();
                    }
                },
                error: (response) => {
                    this.handleServerError(response);
                }
            });
        },
        loadHistory: function () {
            $.ajax(this.api_url + '/history', {
                method: 'get',
                headers: this.api_headers,
                dataType: 'json',
                success: (response) => {
                    if (this.history != response) {
                        this.history = response;
                    }
                },
                error: (response) => {
                    this.handleServerError(response);
                }
            });
        },
        loadRecipients: function () {
            $.ajax(this.api_url + '/users/list', {
                method: 'get',
                headers: this.api_headers,
                dataType: 'json',
                success: (response) => {
                    this.recipients = response;
                },
                error: (response) => {
                    this.handleServerError(response);
                }
            });
        },
        initAutoRefresh: function () {
            setInterval(() => this.loadCurrentUser(), 5000);
        }
    },
});

const receiveMessage = event => {
    if (event.origin === 'http://127.0.0.1:88') {
        window.location.assign("/");
    }
};
window.addEventListener("message", receiveMessage, false);
