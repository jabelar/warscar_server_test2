/// scrShowMapContents(ds_map_id)
var ds_map_id = argument[0];
var key;
var value;

if ds_map_size(ds_map_id) > 0
{
    key = ds_map_find_first(ds_map_id)
    value = ds_map_find_value(ds_map_id, key)
    show_debug_message("Map key = "+string(key)+" with value = "+string(value))
    key = ds_map_find_next(ds_map_id, key)
    while not is_undefined(key)
    {
        value = ds_map_find_value(ds_map_id, key)
        show_debug_message("Map key = "+string(key)+" with value = "+string(value))
        key = ds_map_find_next(ds_map_id, key)
    }    
}
else
{
    show_debug_message("DS map is empty")
}