module SavedHelper
    
    def cookies_saved
        cookies[:saved_list] ||= JSON.generate([])
        JSON.parse(cookies[:saved_list])
    end
    
    def cookies_add_saved(item_id)
        puts "TO ADD #{cookies_saved + [item_id]} "
        cookies_set_saved(cookies_saved + [item_id])
    end
    
    def cookies_delete_saved(item_id)
        puts "TO DEDLETE #{cookies_saved + [item_id]} "
        cookies_set_saved(cookies_saved - [item_id])
    end
    
    def cookies_set_saved(item_ids)
        cookies[:saved_list] = JSON.generate(item_ids)
    end
end
