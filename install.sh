echo 'Enter Your Project Name : '
read project_name
if [ "$project_name" = "" ]; then
	project_name="blog"
fi;
composer create-project --prefer-dist laravel/laravel $project_name
#Into Project folder
cd $project_name
cp .env.example .env
sudo chmod -R 0777 storage/
sudo chmod -R 0777 bootstrap/cache/
php artisan key:generate

echo 'Do you need Auth Scaffolding : Y/N'
read authr
if [ "$authr" = "Y" ]; then
	php artisan make:auth

	echo 'Do you want to Migrate the DB : Y/N'
	read dbmig

	if [ "$dbmig" = "Y" ]; then

		echo 'DB Name : '
		read dbname

		echo 'DB User : '
		read dbuser

		echo 'DB Pass : '
		read dbpass

		sed -i -e "s/.*DB_DATABASE.*/DB_DATABASE="$dbname"/" .env
		sed -i -e "s/.*DB_USERNAME.*/DB_USERNAME="$dbuser"/" .env
		sed -i -e "s/.*DB_PASSWORD.*/DB_PASSWORD="$dbpass"/" .env
	
		php artisan migrate
	fi;
fi;
mv server.php index.php
cp public/.htaccess .htaccess

