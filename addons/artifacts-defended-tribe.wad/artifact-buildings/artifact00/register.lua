-- register defended artifacts

local tags = {"artifact", "__skip_if_exists"}
-- tag artifact is not registered

local indir_noslash = path.dirname(__file__):gsub("/$", "")
-- without / for path.basename() not returning ""

return {
    [path.basename(indir_noslash) .. "_defended"] = tags,
}
