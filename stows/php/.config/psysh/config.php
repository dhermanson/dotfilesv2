<?php

// Automatically autoload Composer dependencies
if (is_file(getcwd() . '/vendor/autoload.php')) {
    require_once getcwd() . '/vendor/autoload.php';
}

return array(
  'requireSemicolons' => true,
  // 'defaultIncludes' => [
  //   './vendor/autoload.php',
  // ],
  // 'startupMessage' => sprintf('<info>%s</info>', shell_exec('uptime'))
);
