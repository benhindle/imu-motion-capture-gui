function [file, path] = getFirstDirectory(files, paths)
    n_files = numel(cellstr(files));
    n_paths = numel(cellstr(paths));
    
    for file_ = 1:n_files
        if n_files == 1
            file = files;
        else 
            file = files{file_};
        end
    end
    
    for path_ = 1:n_paths
        if n_paths == 1
            path = paths;
        else 
            path = paths{path_};
        end
    end
    
end