<?php
/**
 * Example of application using Mafutha Framework.
 * The index.php is the script wich will receive all http requests.
 * @author Rubens Takiguti Ribeiro <rubs33@gmail.com>
 */

// Require the autoload created by composer
require('file://' . __DIR__ . '/../vendor/autoload.php');

// Run the application using the specified config and return the exit status
exit(
    (new \Mafutha\Web\Application())
        ->bootstrap(require('file://' . __DIR__ . '/../config/config.php'))
/*
// uncomment these lines if you are using PHP_SAPI == fpm-fcgi
        ->addHook(
            \Mafutha\Web\Application::AFTER_SEND_RESPONSE,
            function () {
                fastcgi_finish_request();
            }
        )
*/
        ->run()
);
