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

![alt text](http://res.cloudinary.com/dp20nga5l/image/upload/v1464089853/Screenshot_2016-05-24_12.36.40_qobezn.png "Listing layout view")

**Legislation**

![alt text](http://res.cloudinary.com/dp20nga5l/image/upload/v1464090019/Screenshot_2016-05-24_12.40.06_xeupjv.png "Legislation layout view")

Also in the page controller we have custom version of update that allows for us to update the slugs of all children pages when updating a parent page.

` def update
    respond_to do |format|
      # allow for later assignment of parent page
      if @page.update(page_params)
        if @page.parentPage != nil
          @parentPage = Page.find(@page.parentPage)
          if !@page.slug.include? @parentPage.slug
              
              pageHash= Hash.new
              pageHash["slug"]=@parentPage.slug + "/" + @page.title.parameterize
              @page.update(pageHash)
            end
          end

        @childpages = Page.where(parentPage: @page.id)
        @childpages.each do |childpage|
          childUpdateHash = Hash.new
          @makeTitleintoURL = childpage.title.parameterize
          childUpdateHash["slug"]=[@page.slug, @makeTitleintoURL].join("/")
          childpage.update(childUpdateHash)

          @grandchildpages = Page.where(parentPage: childpage.id)
            @grandchildpages.each do |grandchildpage|
              grandchildUpdateHash = Hash.new
              @makeTitleintoURLgrand = grandchildpage.title.parameterize
              grandchildUpdateHash["slug"]=[childpage.slug, @makeTitleintoURLgrand].join("/")
              grandchildpage.update(grandchildUpdateHash)

            end
        end
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end` 