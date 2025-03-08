<?php
$__process_assets = false;
$config = [
    'app.verifiedSealsIds' => '1',
    
    'slim.debug' => true,

    'app.mode' => 'development',

    // deixe true somente se estiver trabalhando nos mapeamentos das entidades
    'doctrine.isDev' => false, 
];

$path = PLUGINS_PATH."/OneClick/files/auth.txt";
if(file_exists($path)) {
    $auth = json_decode(file_get_contents($path), true);
    $_ENV['GOOGLE_RECAPTCHA_SECRET'] = $auth['google-recaptcha-secret'];
    $_ENV['GOOGLE_RECAPTCHA_SITEKEY'] = $auth['google-recaptcha-sitekey'];
}

return $config;