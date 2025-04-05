# [Andy's Brain Book](https://andysbrainbook.readthedocs.io/en/latest/index.html)

## Prereqs

(https://andysbrainbook.readthedocs.io/en/latest/fMRI_Short_Course/fMRI_01_DataDownload.html#fmri-01-datadownload)

Download the aws CLI then to get the sample data:

```bash
sh download.sh
```

## Notes

### UNIX

[`unix/`](./unix/)

- This is all review, nevertheless, doesn't hurt to go over again
- `>` refers to using stdout to put to another file
- `>>` will append not overwrite
- `|` pipe just takes the output from another program into stdin, then runs the subsequent program
- [sort](./unix/sort.sh)
- [for](./unix/for.sh)
- [if](./unix/if.sh) https://www.gnu.org/software/bash/manual/html_node/Bash-Conditional-Expressions.html
- `du -sh *` gives disk usage for all files
- `?` for single character wildcard, `*` for match all
- [awk](./unix/awk.sh)

### FSL

[`fsl/`](./fsl/)

- Flanker Task
 	- Subject sees the below, then says for each one whether pointing right or left.
	- `>>>>>>>>>>>>>>>`
	- `>>>>>>><>>>>>>>`
	- Note that some are congruent with all arrows (same direction)
	- Others are not congruent, like the second example (middle is different than surrounding)
	- You'd think that incongruent response times would be more
- Fixation in middle, then shown for 2s the stimuli, subject presses the left or right button. Then rest interval between (between 8 and 14 seconds).
- Goal test the BOLD difference between congruent and incongruent
- Open up a .nii.gz with `fsleyes filename.nii.gz`
- (sub-08) BET, choose a value 0 to 1. Lower means will attempt to label more as brain, higher means more as skull. Once you click finish will generate `_brain` version of the same file. can load both in FSLEyes and overlay the stripped version in blue. Make sure that we don't label too little as brain. Aim for perfect, but slightly more is better than less. ![comparing_bet](./fsl/images/comparing_bet.png). In the figure, red is 0.9, green is 0.1, and blue (best) is 0.1 for this particular subject.
- Next steps (motion correction and more) with FEAT. First click preprocessing, then select the functional data and which data to output. If the subject moves, we want to correct this so that voxels stay in the same spot. Apparently smoothing helps with removing noise. Then we can register the functional with an affine transform to the structural, then affine again to the standard space MNI152. After press go, brings up web page. ![registration](./fsl/images/example_func2standard1.png) shows in red the functional mapped to the MNI standard space. Pretty darn good!
- Review up to this point: first get the stuff you want to study: the brain. To do that we strip the anatomical image of the skull and just keep the brain. We can do this with the FSL BET software. 0.5 on the BET scale is the middle, 0 is label more as brain, 1 is label more as skull. A good number for our case was 0.2, but make sure that we don't miss out on brain regions. Why do skull stripping only on anatomical and not the functional? Because skull shows up more in anatomical and we end up mapping the functional to the anatomical anyway. Next, the subject might have moved, so we need to align the voxels. We can do that in FSL FEAT and with MCFLIRT. To make the scans more accurate in time, can also correct for slice timing. To further reduce noise and better much up with the standard space, we also smooth over the functional data. Then, we register the data with the anatomical. This transform the functional image to anatomical space. Then we transform the anatomical to MNI space. This gives us a function that goes from function to MNI. It also gives us MNI to functional which is nice when we want to identify regions of the brain that have already been labeled. We use registration in FEAT with 12 degrees of freedom which notates an affine transformation.  .mat files have matrices where when we matmul with the data we transform the data into that space.
