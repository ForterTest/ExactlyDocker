<?php

if (empty($_REQUEST['code'])) {
    exit;
}

$params = [
    'grant_type' => 'authorization_code',
    'client_id' => '3',
    'client_secret' => 'ExkhLeQDrAMmX2f1rbzV0CGrh8yclhGCH7eC0waR',
    'redirect_uri' => 'http://127.0.0.1:88/callback.php',
    'code' => $_REQUEST['code']
];

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, 'http://nginx/oauth/token');
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($params));
$result = curl_exec($ch);
curl_close($ch);

$response = json_decode($result);

if (!empty($response->access_token)) {
    session_start();
    $_SESSION['logged']['access_token'] = $response->access_token;

    echo "<script>
       if (window.opener) {
         window.opener.postMessage(window.location.search);
         window.close();
       }
    </script>";
}
