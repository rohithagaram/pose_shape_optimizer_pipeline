function [tracklets, ground_truth] = tracklets(seq, frm, id)

parms = [seq; frm; id];
cd C:\Users\Manasa\Documents\pose_shape_optimizer_pipeline\devkit_tracking\matlab;
[tracklets, ground_truth] = tracklets_helper(parms(1,:), parms(2,:), parms(3,:));
        
end