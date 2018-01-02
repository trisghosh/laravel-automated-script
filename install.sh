echo 'Enter Your Project Name : '
read project_name
if [ "$project_name" = "" ]; then
	project_name="blog"
fi;
#Into Project folder
composer create-project --prefer-dist laravel/laravel $project_name
cd $project_name
cp .env.example .env
sudo chmod -R 0777 storage/
sudo chmod -R 0777 bootstrap/cache/
php artisan key:generate

echo 'Do you need Auth Scaffolding : Y/N'
read authr
if [ "$authr" = "Y" ]; then
	php artisan make:auth

	echo 'Do you need Migrate the DB : Y/N'
	read dbmig

	if [ "$dbmig" = "Y" ]; then
		php artisan migrate
	fi;
fi;
mv server.php index.php
cp public/.htaccess .htaccess

