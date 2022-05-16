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


datafile4='D:\\Project\\paper4\\统计\\06Topography\\results\\hc_exponents.mat'
hc_exponents = scipy.io.loadmat(datafile4)
hc_exponents = hc_exponents .get('hc_exponents')
#创建info对象
info = mne.create_info(ch_names=biosemi_montage.ch_names, sfreq=250.,ch_types='eeg')
#创建evokeds对象 4
evoked4= mne.EvokedArray(hc_exponents, info)
#evokeds设置通道4
evoked4.set_montage(biosemi_montage)
print(evoked4.data)


datafile15='D:\\Project\\paper4\\统计\\06Topography\\results\\pdoff_exponents.mat'
pdoff_exponents = scipy.io.loadmat(datafile15)
pdoff_exponents = pdoff_exponents .get('pdoff_exponents')
#创建info对象
info = mne.create_info(ch_names=biosemi_montage.ch_names, sfreq=250.,ch_types='eeg')
#创建evokeds对象 5
evoked5= mne.EvokedArray(pdoff_exponents, info)
#evokeds设置通道5
evoked5.set_montage(biosemi_montage)
print(evoked5.data)


datafile16='D:\\Project\\paper4\\统计\\06Topography\\results\\pdon_exponents.mat'
pdon_exponents = scipy.io.loadmat(datafile16)
pdon_exponents = pdon_exponents .get('pdon_exponents')
#创建info对象
info = mne.create_info(ch_names=biosemi_montage.ch_names, sfreq=250.,ch_types='eeg')
#创建evokeds对象 6
evoked6= mne.EvokedArray(pdon_exponents, info)
#evokeds设置通道6
evoked6.set_montage(biosemi_montage)
print(evoked6.data)
#画图
fig, ax = plt.subplots(ncols=3, nrows=2, figsize=(8, 8), gridspec_kw=dict(top=0.9), dpi=300,
                       sharex=True, sharey=True)
#mne.viz.plot_topomap(evoked1.data[:, 0], evoked1.info, axes=ax[0], show=False, cmap='RdBu_r', contours='6', image_interp='bilinear', res=1200)

#mne.viz.plot_topomap(evoked2.data[:, 0], evoked2.info, axes=ax[1], show=False, cmap='RdBu_r', contours='6', res=1200)

# add titles
ax[0][0].set_xlabel('HC', fontsize=10)
ax[0][1].set_xlabel('PD_OFF')
ax[0][2].set_xlabel('PD_ON')
ax[1][0].set_xlabel('HC')
ax[1][1].set_xlabel('PD_OFF')
ax[1][2].set_xlabel('PD_ON')


#将64通道的weight映射到脑电头皮地形中，xy /= 5.3是为了将头皮轮廓扩大到和地形图一样大

im,  cn = mne.viz.plot_topomap(evoked1.data[:, 0], evoked1.info, axes=ax[0][0], show=False, cmap='RdBu_r', contours='6', image_interp='bilinear', res=300)

im1, cn = mne.viz.plot_topomap(evoked2.data[:, 0], evoked2.info, axes=ax[0][1], show=False, cmap='RdBu_r', contours='6', image_interp='bilinear', res=300)

im2, cn = mne.viz.plot_topomap(evoked3.data[:, 0], evoked3.info, axes=ax[0][2], show=False, cmap='RdBu_r', contours='6', image_interp='bilinear', res=300)

im3, cn = mne.viz.plot_topomap(evoked4.data[:, 0], evoked4.info, axes=ax[1][0], show=False, cmap='RdBu_r', contours='6', image_interp='bilinear', res=300)

im4, cn = mne.viz.plot_topomap(evoked5.data[:, 0], evoked5.info, axes=ax[1][1], show=False, cmap='RdBu_r', contours='6', image_interp='bilinear', res=300)

im5, cn = mne.viz.plot_topomap(evoked6.data[:, 0], evoked6.info, axes=ax[1][2], show=False, cmap='RdBu_r', contours='6', image_interp='bilinear', res=300)

plt.colorbar(im,  ax=[ax[0][0], ax[0][1], ax[0][2]], fraction=0.05, label="Offsets")
plt.colorbar(im3, ax=[ax[1][0], ax[1][1], ax[1][2]], fraction=0.05, label="Exponents")


ax[0][0].text(
    -0.15,  # x坐标
    0.1,  # y坐标
    'A',  # 字符串
    multialignment='left',  # 多行对齐方式
    ha='left',  # 左对齐   居中：center
    va='top',  # 顶部对齐
    fontsize=10,  # 字体大小
    wrap=True,  # 字体颜色
    color='black',  # 字体颜色
     )
ax[1][0].text(
    -0.15,  # x坐标
    0.1,  # y坐标
    'B',  # 字符串
    multialignment='left',  # 多行对齐方式
    ha='left',  # 左对齐   居中：center
    va='top',  # 顶部对齐
    fontsize=10,  # 字体大小
    wrap=True,  # 字体颜色
    color='black',  # 字体颜色
     )
plt.show()


