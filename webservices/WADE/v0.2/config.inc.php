<?php
    $wade_user = getenv('POSTGRES_USER');
    $wade_pass = getenv('POSTGRES_PASSWORD');
    $wade_addr = getenv('DATABASE_ADDRESS');
    $wade_db = getenv('POSTGRES_DB');
    $dsn = "postgres://$wade_user:$wade_pass@$wade_addr:5432/$wade_db?persist";
?>
