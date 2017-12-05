<?php

// Automatically autoload Composer dependencies
if (is_file(getcwd() . '/vendor/autoload.php')) {
  require_once getcwd() . '/vendor/autoload.php';
}

$cwd = getcwd();

// alias every PHP class in these directories
$pathsToRequire = [
  [
    'path'=> '/app',
    'ns'=> 'App\\',
  ],
  [
    'path'=> '/app/Models',
    'ns'=> 'App\\Models\\',
  ],
  [
    'path'=> '/app/Models/Eloquent',
    'ns'=> 'App\\Models\\Eloquent',
  ],
];

// foreach ($pathsToRequire as $p) {
//   $dir = $cwd.$p['path'];
//   if (is_dir($dir)) {
//     foreach (scandir($dir) as $file) {
//       if (preg_match('/(.*)\.php$/', $file, $match)) {
//         $ns = $p['ns'];
//         $class = $match[1];
//         class_alias($ns.$class, $class);
//       }
//     }
//   }
// }

// this file is ran for non-laravel psysh sessions...so class might not exist
$GLOBALS['my-query-count'] = 0;
if (class_exists('Illuminate\Support\Facades\DB')) {
  \Illuminate\Support\Facades\DB::listen(function ($q) {
    $GLOBALS['my-query-count'] = $GLOBALS['my-query-count'] + 1;
    logger($GLOBALS['my-query-count'] . ' -- ' . $q->sql . ' -- ' . json_encode($q->bindings));
  });
}

return array(
  'requireSemicolons' => true,
  // 'startupMessage' => sprintf('<info>%s</info>', shell_exec('uptime'))
);
