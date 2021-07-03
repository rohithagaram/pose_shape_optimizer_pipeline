function [wireframe_3d_collection, def_vector_collection] = approx_Align_Wireframe(seq, frm, id)

K = [721.53,0,609.55;0,721.53,172.85;0,0,1];
[intial_wireframe, inital_def_vectors] = initialize_3d_bound_box();
tracklets_data = tracklets(seq, frm, id);
ry = tracklets_data(:,8);
B = mobili(seq, frm, id);  % from mobili formuala we can estimate the 3d location of bounding box given 2d bounding box
T = B(:,4:6)'; % this is the 3d location of the 3d bounding box w.r.t to camera co-ordinate system
phi = ry + pi/2 ; %  this is roation about y axis gound truth value added with some noise
wireframe_3d_collection = [];
def_vector_collection = [];
for i=1:size(phi,1)
    R_y = roty(rad2deg(phi(i)));
    rot_wireframe_3d = R_y * intial_wireframe;
    wireframe_3d_translated = rot_wireframe_3d + T(:,i);
    wireframe_3d_collection = [wireframe_3d_collection; wireframe_3d_translated];
    new_def_vectors = zeros(size(inital_def_vectors));
    for j = 1:size(inital_def_vectors,1)
        in = reshape(inital_def_vectors(j,:),3,14);
        out = R_y * in;
        new_def_vectors(j,:) = reshape(out,size(inital_def_vectors(j,:)));
    end
    def_vector_collection = [def_vector_collection; new_def_vectors];

end

end

