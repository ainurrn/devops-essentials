#!/bin/bash
# Скрипт автоматизации для 30-го дня марафона

echo "=== 1. Создаем резервную копию старого сайта ==="
# Сохраняем в папку backups, которую мы создали в GUI
tar -czvf backups/nginx_backup_$(date +%F_%H-%M).tar.gz /var/www/html/index.html

echo "=== 2. Обновляем страницу на Nginx ==="
echo '<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>DevOps Marathon - Day 30</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #0f172a; color: #f8fafc; text-align: center; padding-top: 100px; }
        h1 { color: #38bdf8; font-size: 3.5em; margin-bottom: 10px; }
        p { font-size: 1.5em; color: #94a3b8; }
        .badge { background-color: #10b981; color: white; padding: 12px 24px; border-radius: 30px; font-weight: bold; display: inline-block; font-size: 1.2em; margin-top: 20px; }
    </style>
</head>
<body>
    <h1>30 Дней DevOps-Марафона пройдены! 🏆</h1>
    <p>Автоматический скрипт успешно сделал бэкап и развернул эту страницу.</p>
    <div class="badge">База заложена. Продолжаем движение!</div>
</body>
</html>' | sudo tee /var/www/html/index.html > /dev/null

echo "=== 3. Проверяем статус веб-сервера ==="
sudo systemctl status nginx --no-pager | grep Active

echo "=== Деплой успешно завершен! ==="
