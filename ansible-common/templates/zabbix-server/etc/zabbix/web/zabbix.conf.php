<?php
// Zabbix GUI configuration file.
global $DB;

$DB['TYPE']     = 'MYSQL';
$DB['SERVER']   = '';
$DB['PORT']     = '0';
$DB['DATABASE'] = 'zabbix';
$DB['USER']     = 'zabbix';
$DB['PASSWORD'] = '';

// Schema name. Used for IBM DB2 and PostgreSQL.
$DB['SCHEMA'] = '';

$ZBX_SERVER      = 'infra-monitoring-2';
$ZBX_SERVER_PORT = '10051';
$ZBX_SERVER_NAME = 'Zabbix';

$IMAGE_FORMAT_DEFAULT = IMAGE_FORMAT_PNG;
