Pretty Permalinks

* Ruby version
	2.3.1
* Rails version
	5.0.0.rc1
* Database
	MySQL ( gem 'mysql2', '>= 0.3.18', '< 0.5')

Following some of the tuttorial [linked phrase](http://blog.teamtreehouse.com/creating-vanity-urls-in-rails)

The idea is to generate a SEO friendly also as human readable url for a publishing set up

Instead of having 

`http://localhost:3000/pages/1` 

I would like to see it closer to this

`http://localhost:3000/tca-1997%2Fpart-1-interpretation-ss-1-11`

There will be a write up of the exact process later

Having the clean permalinks allows for easy access and understanding exactly where you are in the hirearchy

Also having a template variable stored in the page allows for differenciating appearance 

**Listing**
Inline-style: 
![alt text](http://res.cloudinary.com/dp20nga5l/image/upload/v1464089853/Screenshot_2016-05-24_12.36.40_qobezn.png "Listing layout view")

**Legislation**
Inline-style: 
![alt text](http://res.cloudinary.com/dp20nga5l/image/upload/v1464090019/Screenshot_2016-05-24_12.40.06_xeupjv.png "Legislation layout view")