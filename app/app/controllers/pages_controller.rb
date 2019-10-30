class PagesController < ApplicationController
  def home
    s = Set[]
    if(logged_in?)
      s.add(current_user.fullname)
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
  end
end
