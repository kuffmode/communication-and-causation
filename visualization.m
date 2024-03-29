diverge_from_white = [0.         0.4       0.52156863;
       0.19764706 0.59764706 0.71921569;
       0.69882353 0.85882353 0.90745098;
       0.96392157 0.70980392 0.73019608;
       0.87764706 0.21960784 0.30980392;
       0.74901961 0.         0.24705882];

white_red_mono = [1.         1.         1.        ;
       0.96392157 0.70980392 0.73019608;
       0.92784314 0.41960784 0.46039216;
       0.87764706 0.21960784 0.30980392;
       0.81333333 0.10980392 0.27843137;
       0.74901961 0.         0.24705882]; 

gray_to_reds = [0.7215686274509804 0.7215686274509804 0.7215686274509804;
            0.7215686274509804, 0.7215686274509804, 0.7215686274509804;
            1.0, 1.0, 1.0;
            0.9098039215686274, 0.27450980392156865, 0.3254901960784314;
            0.7490196078431373, 0.0, 0.24705882352941178;];

interpolated_divergent = interp1(diverge_from_white, 1:0.0001:size(diverge_from_white,1));
interpolated_red_mono = interp1(white_red_mono, 1:0.0001:size(white_red_mono,1));
interpolated_gray_reds = interp1(gray_to_reds, 1:0.0001:size(gray_to_reds,1));

load('regionDescriptions.mat');
load('hopf_influence_gradient.mat');
load('hopf_residual_gradient.mat');
load('hopf_zscore_gradient.mat');
load('shapley_efficiency.mat')
regions = regionDescriptions.lausanne250;

plotBrain(regions, ...
    influence_gradient, interpolated_red_mono, ...
    'atlas', 'lausanne250', ...
    'limits', [0 max(abs(influence_gradient))], ...
    'savePath', 'figures/surface_plots/hopf_influence_gradient', ...
    'scaling', 0.2);


plotBrain(regions, ...
    residual_gradient, interpolated_gray_reds, ...
    'atlas', 'lausanne250', ...
    'limits', [-max(abs(residual_gradient)) max(abs(residual_gradient))], ...
    'savePath', 'figures/surface_plots/hopf_residual_gradient', ...
    'scaling', 0.2);

plotBrain(regions, ...
    zscore, interpolated_divergent, ...
    'atlas', 'lausanne250', ...
    'limits', [-max(abs(zscore)) max(abs(zscore))], ...
    'savePath', 'figures/surface_plots/hopf_zscore_influence_gradient', ...
    'scaling', 0.2);
