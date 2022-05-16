import mne
import numpy as np
import scipy.io
import matplotlib.pyplot as plt
import numpy as np
#设置通道名
biosemi_montage = mne.channels.make_standard_montage('biosemi32')
#生成数据

datafile1='D:\\Project\\paper4\\统计\\06Topography\\results\\hc_offsets.mat'
hc_offsets = scipy.io.loadmat(datafile1)
hc_offsets = hc_offsets .get('hc_offsets')
#创建info对象
info = mne.create_info(ch_names=biosemi_montage.ch_names, sfreq=250.,ch_types='eeg')
#创建evokeds对象 1                      
evoked1= mne.EvokedArray(hc_offsets, info)
#evokeds设置通道1
evoked1.set_montage(biosemi_montage)
print(evoked1.data)


datafile12='D:\\Project\\paper4\\统计\\06Topography\\results\\pdoff_offsets.mat'
pdoff_offsets = scipy.io.loadmat(datafile12)
pdoff_offsets = pdoff_offsets .get('pdoff_offsets')
#创建info对象
info = mne.create_info(ch_names=biosemi_montage.ch_names, sfreq=250.,ch_types='eeg')
#创建evokeds对象 2
evoked2= mne.EvokedArray(pdoff_offsets, info)
#evokeds设置通道2
evoked2.set_montage(biosemi_montage)
print(evoked2.data)


datafile13='D:\\Project\\paper4\\统计\\06Topography\\results\\pdon_offsets.mat'
pdon_offsets = scipy.io.loadmat(datafile13)
pdon_offsets = pdon_offsets .get('pdon_offsets')
#创建info对象
info = mne.create_info(ch_names=biosemi_montage.ch_names, sfreq=250.,ch_types='eeg')
#创建evokeds对象 3
evoked3= mne.EvokedArray(pdon_offsets, info)
#evokeds设置通道3
evoked3.set_montage(biosemi_montage)
print(evoked3.data)

#画图
fig, ax = plt.subplots(ncols=3, figsize=(8, 4), gridspec_kw=dict(top=0.9),dpi=300,
                       sharex=True, sharey=True)
#mne.viz.plot_topomap(evoked1.data[:, 0], evoked1.info, axes=ax[0], show=False, cmap='RdBu_r', contours='6', image_interp='bilinear', res=1200)

#mne.viz.plot_topomap(evoked2.data[:, 0], evoked2.info, axes=ax[1], show=False, cmap='RdBu_r', contours='6', res=1200)

# add titles
ax[0].set_xlabel('\n'+'HC')
ax[1].set_xlabel('\n'+'PD_OFF')
ax[2].set_xlabel('\n'+'PD_ON')

#将64通道的weight映射到脑电头皮地形中，xy /= 5.3是为了将头皮轮廓扩大到和地形图一样大

im, cn = mne.viz.plot_topomap(evoked1.data[:, 0], evoked1.info, axes=ax[0], show=False, cmap='RdBu_r', contours='6', image_interp='bilinear', res=300)

im1, cn = mne.viz.plot_topomap(evoked2.data[:, 0], evoked2.info, axes=ax[1], show=False, cmap='RdBu_r', contours='6', image_interp='bilinear', res=300)

im2, cn = mne.viz.plot_topomap(evoked3.data[:, 0], evoked3.info, axes=ax[2], show=False, cmap='RdBu_r', contours='6', image_interp='bilinear', res=300)

plt.colorbar(im, ax=[ax[0], ax[1], ax[2]], fraction=0.02, label="Offsets")

#plt.colorbar(im1, ax=ax[1])
plt.show()


