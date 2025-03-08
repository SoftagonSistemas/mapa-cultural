<?php 

$config = [
    'themes.active' => 'CustomTheme',
];

$path = PLUGINS_PATH."/OneClick/files/auth.txt";
if(file_exists($path)) {
    $auth = json_decode(file_get_contents($path), true);
    $_ENV['GOOGLE_RECAPTCHA_SECRET'] = $auth['google-recaptcha-secret'];
    $_ENV['GOOGLE_RECAPTCHA_SITEKEY'] = $auth['google-recaptcha-sitekey'];
}

return $config;