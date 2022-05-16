import mne
import numpy as np
import scipy.io
import matplotlib.pyplot as plt
import numpy as np
#设置通道名
biosemi_montage = mne.channels.make_standard_montage('biosemi32')
#生成数据
a = 'a'
b = 'b'
c = 'c'
d = 'd'
e = 'e'
f = 'f'

datafile1 = 'D:\\Project\\paper4\\统计\\06Topography\\results\\' + a + '.mat'
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


datafile4 = 'D:\\Project\\paper4\\统计\\06Topography\\results\\' + d + '.mat'
# 读取mat文件
data4 = scipy.io.loadmat(datafile4)
# 读取矩阵数据
data4 = data4 .get(d)
# 创建info对象
info = mne.create_info(ch_names=biosemi_montage.ch_names, sfreq=250.,ch_types='eeg')
# 创建evokeds对象 1
evoked4 = mne.EvokedArray(data4, info)
# evokeds设置通道 1
evoked4.set_montage(biosemi_montage)
print(evoked4.data)


datafile5 = 'D:\\Project\\paper4\\统计\\06Topography\\results\\' + e + '.mat'
# 读取mat文件
data5 = scipy.io.loadmat(datafile5)
# 读取矩阵数据
data5 = data5 .get(e)
# 创建info对象
info = mne.create_info(ch_names=biosemi_montage.ch_names, sfreq=250.,ch_types='eeg')
# 创建evokeds对象 1
evoked5 = mne.EvokedArray(data5, info)
# evokeds设置通道 1
evoked5.set_montage(biosemi_montage)
print(evoked5.data)

datafile6 = 'D:\\Project\\paper4\\统计\\06Topography\\results\\' + f + '.mat'
# 读取mat文件
data6 = scipy.io.loadmat(datafile6)
# 读取矩阵数据
data6 = data6 .get(f)
# 创建info对象
info = mne.create_info(ch_names=biosemi_montage.ch_names, sfreq=250.,ch_types='eeg')
# 创建evokeds对象 1
evoked6 = mne.EvokedArray(data6, info)
# evokeds设置通道 1
evoked6.set_montage(biosemi_montage)
print(evoked6.data)
#画图
fig, ax = plt.subplots(ncols=3, nrows=2, figsize=(8, 6), gridspec_kw=dict(top=0.9), dpi=300,
                       sharex=True, sharey=True)
#mne.viz.plot_topomap(evoked1.data[:, 0], evoked1.info, axes=ax[0], show=False, cmap='RdBu_r', contours='6', image_interp='bilinear', res=1200)

#mne.viz.plot_topomap(evoked2.data[:, 0], evoked2.info, axes=ax[1], show=False, cmap='RdBu_r', contours='6', res=1200)

# add titles
ax[0][0].set_xlabel('HC vs PD_OFF')
ax[0][1].set_xlabel('HC vs PD_ON')
ax[0][2].set_xlabel('PD_OFF vs PD_ON')
ax[1][0].set_xlabel('HC vs PD_OFF')
ax[1][1].set_xlabel('HC vs PD_ON')
ax[1][2].set_xlabel('PD_OFF vs PD_ON')


#ax[0][1].set_title('Comparisons of Offsets')
#ax[1][1].set_title('Comparisons of Exponents')

#将64通道的weight映射到脑电头皮地形中，xy /= 5.3是为了将头皮轮廓扩大到和地形图一样大

im, cn = mne.viz.plot_topomap(evoked1.data[:, 0], evoked1.info, axes=ax[0][0], show=False, sensors=False,
                              mask=np.array([False,False,False,False,True,False,False,False,True,False,False,True,
                                             False,False,False,False,False,False,True,False,False,False,False,False,
                                             False,False,False,False,False,False,False,True]),
                              mask_params=dict(marker='*', markerfacecolor='b', markeredgecolor='b',linewidth=0, markersize=5),
                              cmap='RdBu_r', contours='6', image_interp='bilinear', res=300)


im1, cn = mne.viz.plot_topomap(evoked2.data[:, 0], evoked2.info, axes=ax[0][1], show=False, sensors=False,
                               mask=np.array([True,False,True,False,False,False,False,False,True,False,False,False,
                                              False,False,False,False,False,False,False,False,False,False,False,False,
                                              False,False,False,True,True,False,False,True]),
                               mask_params=dict(marker='*', markerfacecolor='b', markeredgecolor='b',linewidth=0, markersize=5),
                               cmap='RdBu_r', contours='6', image_interp='bilinear', res=300)


im2, cn = mne.viz.plot_topomap(evoked3.data[:, 0], evoked3.info, axes=ax[0][2], show=False, sensors=False,
                             mask=np.array([False,False,True,False,False,True,False,True,False,True,False,False,False,
                                            False,True,True,False,False,False,False,True,False,True,False,True,False,
                                            False,True,False,False,False,False]),
                               mask_params=dict(marker='*', markerfacecolor='b', markeredgecolor='b',linewidth=0, markersize=5),
                               cmap='RdBu_r', contours='6', image_interp='bilinear', res=300)


im3, cn = mne.viz.plot_topomap(evoked4.data[:, 0], evoked4.info, axes=ax[1][0], show=False, sensors=False,
                              mask=np.array([False]),
                              mask_params=dict(marker='*', markerfacecolor='b', markeredgecolor='b',linewidth=0, markersize=5),
                              cmap='RdBu_r', contours='6', image_interp='bilinear', res=300)


im4, cn = mne.viz.plot_topomap(evoked5.data[:, 0], evoked5.info, axes=ax[1][1], show=False, sensors=False,
                               mask=np.array([False]),
                               mask_params=dict(marker='*', markerfacecolor='b', markeredgecolor='b',linewidth=0, markersize=5),
                               cmap='RdBu_r', contours='6', image_interp='bilinear', res=300)


im5, cn = mne.viz.plot_topomap(evoked6.data[:, 0], evoked6.info, axes=ax[1][2], show=False, sensors=False,
                             mask=np.array([False,False,False,False,False,True,False,True,False,True,False,
                                            False,False,False,False,False,False,False,False,False,False,False,
                                            True,False,False,False,False,False,False,False,False,False]),
                               mask_params=dict(marker='*', markerfacecolor='b', markeredgecolor='b',linewidth=0, markersize=5),
                               cmap='RdBu_r', contours='6', image_interp='bilinear', res=300)

#plt.colorbar(im,  ax=[ax[0][0], ax[0][1], ax[0][2]], fraction=0.05, label="Percent Maximum Test Statistic")
#plt.colorbar(im3, ax=[ax[1][0], ax[1][1], ax[1][2]], fraction=0.05, label="Percent Maximum Test Statistic")
plt.colorbar(im5, ax=[ax[0][2], ax[1][2]], fraction=0.1, label="Percent Maximum Test Statistic")
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


