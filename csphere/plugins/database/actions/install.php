<?php

/**
 * Add database content
 *
 * PHP Version 5
 *
 * @category  Plugins
 * @package   Database
 * @author    Hans-Joachim Piepereit <contact@csphere.eu>
 * @copyright 2013 cSphere Team
 * @license   http://opensource.org/licenses/bsd-license Simplified BSD License
 * @link      http://www.csphere.eu
 **/

$loader = \csphere\core\service\Locator::get();

$dir = \csphere\core\http\Input::get('get', 'dir');

// Add breadcrumb navigation
$bread = new \csphere\core\template\Breadcrumb('admin');
$bread->add('system');
$bread->plugin('database', 'control');
$bread->add('tables');
$bread->add('details', 'database/details/dir/' . $dir);
$bread->add('install', 'database/install/dir/' . $dir);
$bread->trace();

// Get translation details
$lang = \csphere\core\translation\Fetch::keys('database');

$install = \csphere\core\translation\Fetch::key('default', 'install');

// Get plugin database details if it exists
$meta = new \csphere\core\plugins\Database($dir);

$exists = $meta->exists();

if ($exists === true) {

    // Work with plugin database content
    $meta->install(true, true);

    // Generate message content
    $params   = ['dir' => $dir];
    $previous = \csphere\core\url\Link::href('database', 'details', $params);

    $data = ['previous' => $previous, 'type' => 'green'];

    $data['plugin_name'] = $lang['database'];
    $data['action_name'] = $install;
    $data['message']     = $lang['install_ok'];

    // Send data to view
    $view = $loader->load('view');

    $view->template('default', 'message', $data);
}
