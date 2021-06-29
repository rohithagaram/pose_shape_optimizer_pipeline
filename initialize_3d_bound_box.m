function [Cam_wire_frame_cords, Cam_deformation_vectors] = initialize_3d_bound_box()
% this functions scales the wire frame to the avg dimensions and transfroms
% the cooridantes of the wireframe and the deformation vectors in to the
% camera co orindate system
% world co-oridnate system -> world : x=Left , Y= back ,z = up
% camera co-ordiante system ->  Camera: x = right, y = down, z = forward

[wireframe, deformation_vectors] = scale_wireframe();
W_C_rotation = [-1 0 0; 0 0 -1; 0 -1 0]'; % World frame (world coordinate system) to camera frame (camera coordinate system)
Cam_wire_frame_cords = W_C_rotation * wireframe;

Cam_deformation_vectors = zeros(size(deformation_vectors));
for i = 1:size(deformation_vectors,1)
    in = reshape(deformation_vectors(i,:),3,14);
    out = W_C_rotation * in;
    Cam_deformation_vectors(i,:) = reshape(out,size(deformation_vectors(i,:)));
end

end
