module SavedHelper
    
    def saved
        JSON.parse(cookies[:saved_list])
    end
    
    def add_saved(item_id)
        set_saved(saved + [item_id])
    end
    
    def delete_saved(item_id)
        set_saved(saved - [item_id])
    end
    
    def init_saved
        cookies[:saved_list] ||= JSON.generate([])
    end
    
    
    private
    
    def set_saved(new_saved_list)
        cookies[:saved_list] = JSON.generate(new_saved_list)
    end
end
