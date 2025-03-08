<?php

return [
    'plugins' => [
        'AdminLoginAsUser',
        'MultipleLocalAuth' => [ 'namespace' => 'MultipleLocalAuth' ],
        'SpamDetector',
        'OneClick',
        'MapasBlame' => [
            'namespace' => 'MapasBlame',
            'config' => [
                'request.logData.PATCH' => function ($data) {
                    return $data;
                },
            ]
        ],
    ]
];
