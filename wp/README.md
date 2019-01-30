# install
 - get yml from [docker wordpress][0]
   - add volumes for wordpress and db
 - normal volume mount
```
volumes:
  - ./wp-content:/var/www/html/wp-content
```
 - study purpose volume mount
```
volumes:
  - ./wp-html:/var/www/html/
```
 - setup db name, user, password
 - build and run
```
sudo docker-compose -f docker-compose.yml up -d --build
```
 - check service up
```
sudo docker ps -a
```
 - turn down service
```
sudo docker-compose down
```

[0]: https://hub.docker.com/_/wordpress/

# init wordpress
 - go to localhost:8080 to install wordpress
 - remember your username, password

# connect db
 - just connect to database and search for table contents related to plugin
```
sudo docker exec -it wp_db_1 bash
mysql -u root -pROOTPASS mydb
select * from wp_options where option_name like "%plugin%";
```
 - table wp_options
   - field option_name
     - active_plugins
       - activated plugin
     - uninstall_plugins
       - uninstalled plugin
     - _site_transient_update_plugins
       - transient plugin version info
     - _transient_plugin_slugs
       - plugins listed on wordpress admin
     - _transient_timeout_plugin_slugs
       - last plugin info update time
   - field option_value
     - stored value as serialize string

# use plugins
 - when a user loads a page, wp sends request to db to get a list of active plugins and loads them
 - wp-admin/index.php
   - require admin.php
 - wp-admin/admin.php
   - require wp-load.php
 - wp-load.php
   - require wp-config.php
 - wp-config.php
   - require wp-settings.php
 - wp-settings.php
   - wp_get_active_and_valid_plugins()
   - find plugins under WP_PLUGIN_DIR
   - include plugins in for loop
 - wp-includes/load.php
   - get_option()
 - wp-includes/option.php
   - send request to database and get active plugins
   - wp_load_alloptions()
   - $wpdb->get_row()
   - wp_cache_get()
   - wp_cache_add()

# list plugins
 - on installed plugin page, wp get transient plugins from db
 - wp-admin/plugins.php
   - admin plugin panel
   - _get_list_table(WP_Plugins_List_Table)
   - $wp_list_table->prepare_items();
   - $wp_list_table->display();
 - wp-admin/includes/list-table.php
   - helper function display table items
 - wp-admin/includes/class-wp-plugins-list-table.php
   - wp-admin/includes/class-wp-list-table.php
     - list table base class
   - plugin list table
   - get_site_transient()
 - wp-includes/option.php
   - get option from db

# install plugins
 - when a user tries to install plugin from admin panel, wp download the plugin ino wp-content/plugins
 - wp-admin/update.php
   - install-plugin
 - wp-admin/includes/plugin-install.php
   - send curl to download plugins to WP_PLUGIN_DIR
 - WP_PLUGIN_DIR
   - wp-content/plugins

# reference
 - [Creating a Simple WordPress Plugin, Under the Hood][1]
 - [How to Install a WordPress Plugin – Step by Step for Beginners][2]
 - [Setting up WordPress with Docker][3]

[1]: https://wpshout.com/quick-guides/first-plugin-die/
[2]: https://www.wpbeginner.com/beginners-guide/step-by-step-guide-to-install-a-wordpress-plugin-for-beginners/
[3]: https://cntnr.io/setting-up-wordpress-with-docker-262571249d50
