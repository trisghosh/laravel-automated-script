echo 'Enter Your Project Name : '
read project_name
#Into Project folder
composer create-project --prefer-dist laravel/laravel $project_name
cd $project_name
cp .env.example .env
sudo chmod -R 0777 storage/
sudo chmod -R 0777 bootstrap/cache/
php artisan key:generate

