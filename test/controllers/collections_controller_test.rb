require 'test_helper'

class CollectionsControllerTest < ActionDispatch::IntegrationTest



  
  test "should show all" do
    get collection_url(CollectionItem.everything)
    assert_response :success
  end
  
  test "should show men" do
    get collection_url('men')
    assert_response :success
  end
  
  test "should show women" do
    get collection_url('women')
    assert_response :success
  end
  
  test "should show kids" do
    get collection_url('kids')
    assert_response :success
  end
  
  test "should show new_ins" do
    get collection_url(CollectionItem.new_ins)
    assert_response :success
  end
  
  
  
  
  
  
  test "should redirect index" do
    get collections_url
    assert_redirected_to collection_url(CollectionItem.everything)
  end
  
  test "should redirect show if not in collections" do
    get collection_url('invalid collection')
    assert_redirected_to collection_url(CollectionItem.everything)
  end
  
  
  
  
  
  

  test "filtering with unselected options should get show" do 
    get collection_url(CollectionItem.everything), params:
    {
      colours: [''],
      size: '',
      tags: ['']
    }
    assert_response :success
  end
  
  test "filtering with selected options should get show" do 
    get collection_url(CollectionItem.everything), params:
    {
      colours: ItemVariant.colours.keys,
      size: ItemVariant.sizes.keys.first,
      tags: TagItem.tags.keys
    }
    assert_response :success
  end
  
  test "filtering with selected options on collection should get show" do 
    get collection_url('men'), params:
    {
      colours: ItemVariant.colours.keys,
      size: ItemVariant.sizes.keys.first,
      tags: TagItem.tags.keys
    }
    assert_response :success
  end

end
