create user 'insertCoffeeFlow'@'localhost' identified by 'coffeeflow10';

grant INSERT on metricas.* to 'insertCoffeeFlow'@'localhost';

flush privileges;