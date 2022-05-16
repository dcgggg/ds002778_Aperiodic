import mne
import numpy as np
import scipy.io
import matplotlib.pyplot as plt
import numpy as np
# 设置通道名
biosemi_montage = mne.channels.make_standard_montage('biosemi32')
# 定义变量名
a = 'a'
b = 'b'
c = 'c'

datafile1 = 'D:\\Project\\paper4\\统计\\06Topography\\results\\' + a + '.mat'
# 读取mat文件
data1 = scipy.io.loadmat(datafile1)
# 读取矩阵数据
data1 = data1 .get(a)
# 创建info对象
info = mne.create_info(ch_names=biosemi_montage.ch_names, sfreq=250.,ch_types='eeg')
# 创建evokeds对象 1
evoked1 = mne.EvokedArray(data1, info)
# evokeds设置通道 1
evoked1.set_montage(biosemi_montage)
print(evoked1.data)


datafile2 = 'D:\\Project\\paper4\\统计\\06Topography\\results\\' + b + '.mat'
# 读取mat文件
data2 = scipy.io.loadmat(datafile2)
# 读取矩阵数据
data2 = data2 .get(b)
# 创建info对象
info = mne.create_info(ch_names=biosemi_montage.ch_names, sfreq=250.,ch_types='eeg')
# 创建evokeds对象 2
evoked2 = mne.EvokedArray(data2, info)
# evokeds设置通道 2
evoked2.set_montage(biosemi_montage)
print(evoked2.data)


datafile3 = 'D:\\Project\\paper4\\统计\\06Topography\\results\\' + c + '.mat'
# 读取mat文件
data3 = scipy.io.loadmat(datafile3)
# 读取矩阵数据
data3 = data3 .get(c)
# 创建info对象
info = mne.create_info(ch_names=biosemi_montage.ch_names, sfreq=250.,ch_types='eeg')
# 创建evokeds对象 3
evoked3 = mne.EvokedArray(data3, info)
# evokeds设置通道 3
evoked3.set_montage(biosemi_montage)
print(evoked3.data)

# 画图
fig, ax = plt.subplots(ncols=3, figsize=(8, 4), gridspec_kw=dict(top=0.9),dpi=300,
                       sharex=True, sharey=True)
#mne.viz.plot_topomap(evoked1.data[:, 0], evoked1.info, axes=ax[0], show=False, cmap='RdBu_r', contours='6', image_interp='bilinear', res=1200)

#mne.viz.plot_topomap(evoked2.data[:, 0], evoked2.info, axes=ax[1], show=False, cmap='RdBu_r', contours='6', res=1200)

# add titles
#ax[0].set_title('HC vs PD_OFF')
#ax[1].set_title('HC vs PD_ON')
#ax[2].set_title('PD_OFF vs PD_ON')
#ax[1].set_xlabel('\n'+'\n'+'Comparisons of Offsets')

ax[0].set_xlabel('\n'+'HC vs PD_OFF')
ax[1].set_xlabel('\n'+'HC vs PD_ON')
ax[2].set_xlabel('\n'+'PD_OFF vs PD_ON')
ax[1].set_title('Comparisons of Offsets'+'\n')
#将64通道的weight映射到脑电头皮地形中，xy /= 5.3是为了将头皮轮廓扩大到和地形图一样大

im, cn = mne.viz.plot_topomap(evoked1.data[:, 0], evoked1.info, axes=ax[0], show=False, sensors=False,
                              mask=np.array([False,False,False,False,True,False,False,False,True,False,False,True,
                                             False,False,False,False,False,False,True,False,False,False,False,False,
                                             False,False,False,False,False,False,False,True]),
                              mask_params=dict(marker='*', markerfacecolor='b', markeredgecolor='b',linewidth=0, markersize=5),
                              cmap='RdBu_r', contours='6', image_interp='bilinear', res=300)


im1, cn = mne.viz.plot_topomap(evoked2.data[:, 0], evoked2.info, axes=ax[1], show=False, sensors=False,
                               mask=np.array([True,False,True,False,False,False,False,False,True,False,False,False,
                                              False,False,False,False,False,False,False,False,False,False,False,False,
                                              False,False,False,True,True,False,False,True]),
                               mask_params=dict(marker='*', markerfacecolor='b', markeredgecolor='b',linewidth=0, markersize=5),
                               cmap='RdBu_r', contours='6', image_interp='bilinear', res=300)


im2, cn = mne.viz.plot_topomap(evoked3.data[:, 0], evoked3.info, axes=ax[2], show=False, sensors=False,
                             mask=np.array([False,False,True,False,False,True,False,True,False,True,False,False,False,
                                            False,True,True,False,False,False,False,True,False,True,False,True,False,
                                            False,True,False,False,False,False]),
                               mask_params=dict(marker='*', markerfacecolor='b', markeredgecolor='b',linewidth=0, markersize=5),
                               cmap='RdBu_r', contours='6', image_interp='bilinear', res=300)

plt.colorbar(im, ax=[ax[0], ax[1], ax[2]], fraction=0.02, label="Percent Maximum Test Statistic")

#plt.colorbar(im1, ax=ax[1])
plt.show()


