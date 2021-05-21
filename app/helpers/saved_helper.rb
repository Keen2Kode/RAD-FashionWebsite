module SavedHelper
    
    def saved
        cookies[:saved_list] ||= JSON.generate([])
        JSON.parse(cookies[:saved_list])
    end
    
    def cookies_add_saved(item_id)
        set_saved(saved + [item_id])
    end
    
    def cookies_delete_saved(item_id)
        set_saved(saved - [item_id])
    end
    
    
    def cookies_reset_saved(item_ids)
        set_saved(item_ids)
    end
    
    
    private
    
    def set_saved(new_saved_list)
        cookies[:saved_list] = JSON.generate(new_saved_list)
    end
end
