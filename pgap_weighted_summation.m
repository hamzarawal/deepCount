%----------------------------
%folder paths for input maps
%----------------------------
fmap_path = 'E:/ITU/Dr_Mohsen/houseCounting/new_data_fmaps/relu5_blk'; %relu5_blk
detection_path = 'E:/ITU/Dr_Mohsen/houseCounting/new_data_fmaps/dmaps'; %ssnet

%----------------------------
%folder paths for outputs
%----------------------------
output_path = 'E:/ITU/Dr_Mohsen/houseCounting/new_data_fmaps/pf_maps'; %product maps
output_path1 = 'E:/ITU/Dr_Mohsen/houseCounting/new_data_fmaps/pgap_maps'; %Global Average Pooled Vectors

%reading file names
files = dir(fmap_path);
total_files = length(files)-2;

%resize
sz = 42;

tic

for i = 1:total_files %total_files
    disp(i)
    img_id = files(i+2).name;
    fmapp = load([fmap_path '/' img_id]);
    fmap = fmapp.fmap;
    dmapp = load([detection_path '/' img_id]);
    dmap = dmapp.structure;

    dmap = imresize(dmap, [sz, sz], 'bilinear', 'Antialiasing',true);

    f_map = zeros(10,10,1024);
    f_map(:,:,:) = fmap(1,:,:,:);
    
    f_map_r = imresize(f_map, [sz, sz], 'bilinear', 'Antialiasing',true);

    size(f_map_r);
    
    pfmap = zeros(sz,sz,size(fmap,4));
    Pgap = zeros(1,size(fmap,4));
	
	%multiply attention map with each channel of feature volume
    for j = 1:size(fmap,4)
        map = f_map_r(:,:,j);
        pmap = map * dmap;
        pfmap(:,:,j) = pmap;
        Pgap(1,j)  = sum(sum(pfmap(:,:,j))) / numel(pfmap(:,:,j));
    end
	
	%save files
    save([output_path '/' img_id], 'pfmap')
    save([output_path1 '/' img_id], 'Pgap')
    
    temp = 'pfmap';
    size(pfmap);
    max(max(pfmap(:,:,1)));
    
end
toc
    
    