<?php



// Automatically autoload Composer dependencies
// if (is_file(getcwd() . '/vendor/autoload.php')) {
//   require_once getcwd() . '/vendor/autoload.php';
// }

# $cwd = getcwd();

// this file is ran for non-laravel psysh sessions...so class might not exist
// $GLOBALS['my-query-count'] = 0;
// if (class_exists('Illuminate\Support\Facades\DB')) {
//   \Illuminate\Support\Facades\DB::listen(function ($q) {
//     $GLOBALS['my-query-count'] = $GLOBALS['my-query-count'] + 1;
//     logger($GLOBALS['my-query-count'] . ' -- ' . $q->sql . ' -- ' . json_encode($q->bindings));
//   });
// }

$config =  array(
  'requireSemicolons' => true,
  // 'startupMessage' => sprintf('<info>%s</info>', shell_exec('uptime'))
  // 'defaultIncludes' => [
  //   'vendor/autoload.php',
  // ]
);

if (getenv("INSIDE_EMACS")) {
  $config['pager'] = 'cat';
}

return $config;
