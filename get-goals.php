#!/usr/bin/php
<?php
// returns first level subdirectories from the current directory with goal>1
// Tomasz Klim, Jan 2014



function get_goal($dirname)
{
	$path = escapeshellarg($dirname);
	$lines = explode("\r\n", shell_exec("mfsgetgoal $path"));
	list($foo, $goal) = explode(": ", trim($lines[0]));
	return $goal;
}


function check_directories($dirname)
{
	$handle = @opendir($dirname);

	if ($handle === false)
		return false;

	while (false !== ($file = @readdir($handle))) {
		if ($file != "." && $file != ".." && is_dir("$dirname/$file")) {
			$path = "$dirname/$file";

			$goal = get_goal($path);
			if ($goal > 1)
				echo "$path\n";
			else
				check_directories($path);
		}
	}

	closedir($handle);
}


$root = "/srv/mounts/moosefs";

if (!empty($argv[1]) && strpos($argv[1], "..") === false)
	$root .= "/" . $argv[1];

check_directories($root);
