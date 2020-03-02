<?php
session_start();

if (!empty($_REQUEST['logout'])) {
    session_destroy();
    header('Location: /');
}
?>
<html>
    <head>
        <link href="bootstrap.min.css" rel="stylesheet" />
    </head>
    <body>
        <div id="app" class="container" style="margin: 20px;">
        <?php if (empty($_SESSION['logged']['access_token'])): ?>
            <login-button></login-button>
        <?php else: ?>
            <div class="mb-5 col-md-3">
                <strong>{{ current_user.name }}</strong>
                <br />
                Balance: {{ userBalance }} BTC
                <br/><a href="/?logout=1" class="btn btn-primary btn-sm">Logout</a>
            </div>

            <div class="row">
                <div class="mb-5 col-md-6">
                    <h4>Send to user</h4>
                    <div class="input-group">
                        <select class="form-control" v-model.number="send.uid">
                            <option value="0" selected>-- select recipient --</option>
                            <option v-for="user in recipients" v-bind:value="user.id">{{ user.name }}</option>
                        </select>
                        <input type="text" class="form-control" placeholder="Amount" aria-label="Amount" aria-describedby="button-addon2" v-model.number="send.amount" />
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="button" v-on:click="sendToUser">Send to user</button>
                        </div>
                    </div>
                </div>

                <div class="mb-5 col-md-6">
                    <h4>Send to users</h4>

                    <div class="input-group" v-for="msend in multi_send">
                        <select class="form-control" v-model.number="msend.uid">
                            <option value="0" selected>-- select recipient --</option>
                            <option v-for="user in recipients" v-bind:value="user.id">{{ user.name }}</option>
                        </select>
                        <input type="text" class="form-control" placeholder="Amount" aria-label="Amount" aria-describedby="button-addon2" v-model.number="msend.amount" />
                    </div>

                    <div class="mt-1">
                        <button class="btn btn-secondary" type="button" v-on:click="addRecipient">Add another</button>
                        <button class="btn btn-primary" type="button" v-on:click="sendToUsers">Send to users</button>
                    </div>
                </div>
            </div>

            <div class="mb-5 col-md-12">
                <h4>History of operations</h4>
                <table class="table table-hover">
                    <tr>
                        <th>Date</th>
                        <th>User</th>
                        <th class="text-right">Amount</th>
                        <th class="text-right">Balance</th>
                    </tr>
                    <tr v-for="operation in history">
                        <td>{{ operation.datetime }}</td>
                        <td>{{ operation.user_name }} ({{ operation.user_email }})</td>
                        <td class="text-right">{{ operation.amount > 0 ? "+" + operation.amount.toFixed(2) : operation.amount.toFixed(2) }}</td>
                        <td class="text-right">{{ operation.new_balance.toFixed(2) }}</td>
                    </tr>
                </table>
            </div>
        <?php endif; ?>
        </div>

        <script src="jquery-3.4.1.min.js"></script>
        <script src="bootstrap.min.js"></script>
        <script src="vue.min.js"></script>
        <script>
            var logged_in = <?=(empty($_SESSION['logged']['access_token']) ? 'false' : 'true')?>;
            var access_token = "<?=$_SESSION['logged']['access_token']?>";
        </script>
        <script src="api_client.js"></script>
    </body>
</html>