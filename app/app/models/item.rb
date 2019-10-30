class Item < ApplicationRecord
    def self.addItems(result, items, name, terms, pref)
        result[name]=[]
        items[name].each do |n|
            match = n['matching_terms']&terms
            if(match.length>0)
                result[name].push(n)
                match.each do |t|
                    pref.add(t)
                end
            end
        end
    end
end