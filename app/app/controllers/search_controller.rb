class SearchController < ApplicationController
    def findbyterm
        @result = {}
        calendar = JSON.parse(File.read(File.join(Rails.root, 'calendar.json')))
        contacts = JSON.parse(File.read(File.join(Rails.root, 'contacts.json')))
        dropbox = JSON.parse(File.read(File.join(Rails.root, 'dropbox.json')))
        slack = JSON.parse(File.read(File.join(Rails.root, 'slack.json')))
        tweet = JSON.parse(File.read(File.join(Rails.root, 'tweet.json')))
        terms = params[:terms].split(' ')
        if(logged_in?)
            terms.push(current_user.fullname)
        end
        # self defined static method in items.rb
        s = Set[]
        Item.addItems(@result, calendar, 'calendar', terms, s)
        Item.addItems(@result, contacts, 'contacts', terms, s)
        Item.addItems(@result, dropbox, 'dropbox', terms, s)
        Item.addItems(@result, slack, 'slack', terms, s)
        Item.addItems(@result, tweet, 'tweet', terms, s)
        if(logged_in?)
            s.each do |p|
                pref = Preference.new(term:p,times:0,user_id:current_user.id)
                # puts pref.term
                t = -1
                if !pref.save
                    preflist = Preference.all
                    preflist.each do |pre|
                        if pre.user_id==current_user.id and pre.term==p
                            t = pre.times
                        end
                    end
                    puts t
                    t = t+1
                    # pref = Preference.new(term:p,times:t,user_id:current_user.id)
                    Preference.update(term:p,times:t,user_id:current_user.id)
                end
            end
            @userPref = {}
            Preference.all.each do |p|
                if p.user_id==current_user.id
                    @userPref[p.term] = p.times
                end
            end
            puts @userPref
        end
        render 'pages/home'
    end
end