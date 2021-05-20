module SavedHelper
    
    def saved
        cookies[:saved_list] ||= JSON.generate([])
        JSON.parse(cookies[:saved_list])
    end
    
    def add_saved(item_id)
        set_saved(saved + [item_id])
    end
    
    def delete_saved(item_id)
        set_saved(saved - [item_id])
    end
    
    
    
    private
    
    def set_saved(new_saved_list)
        
        cookies[:saved_list] = JSON.generate(new_saved_list)
    end
end
