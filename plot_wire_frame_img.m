function plot_wire_frame_img(seq, frm, id)
K = [721.53,0,609.55;0,721.53,172.85;0,0,1];
tracklets_data = tracklets(seq, frm, id);
approx_aligned_wireframe_collection = approx_Align_Wireframe(seq, frm, id);

for i=1:size(seq,2)
    approx_aligned_wf = approx_aligned_wireframe_collection(3*i-2:3*i,:);
    approx_proj_wf = K * approx_aligned_wf;
    approx_wf_img = [approx_proj_wf(1,:) ./ approx_proj_wf(3,:); approx_proj_wf(2,:) ./ approx_proj_wf(3,:)];     
    img = "left_colour_imgs/" + string(tracklets_data(i,1)) + "_" + string(tracklets_data(i,2)) + ".png";
    figure;  
    subplot(2,2,1);
    imshow(img); 
    hold on; 
    subplot(2,2,2);
    visualizeWireframe2D(img, approx_wf_img);
    title("Approximately Aligned Wireframe"); 
    pause(0.5);
    
end

end