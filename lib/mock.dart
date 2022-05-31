import 'dart:convert';

import 'package:zhsou/abstract.dart';

import 'entity.dart';

const mockJsonResponseList = [
  """
{
	"code": 0,
	"msg": "Success",
	"data": {
		"useTime": 0.007,
		"total": 2280,
		"page": 1,
		"totalPage": 228,
		"records": [
			{
				"id": 149,
				"text": "【华为手机】华为手机价格,价格查询,华为手机怎么样?",
				"document": {
					"url": "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimages.51bi.com%2Fopt%2Fsiteimg%2Fp%2F20150108%2Feaae4487e7a99d22b329941d58d1abd8.jpeg&refer=http%3A%2F%2Fimages.51bi.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1632604004&t=d1d82d8b01cb1bd52e4ceb5818665a06",
					"text": "【华为手机】华为手机价格,价格查询,华为手机怎么样?"
				}
			},
			{
				"id": 331,
				"text": "超薄时尚手机 vivo x5max报价2700",
				"document": {
					"url": "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fi3.pro.fd.zol-img.com.cn%2Ft_s640x2000_w1%2Fg1%2FM08%2F06%2F05%2FCg-4jlST4T-IRbrTAAelilpDSrQAAPGmAFng4AAB6Wi419.jpg&refer=http%3A%2F%2Fi3.pro.fd.zol-img.com.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1632554551&t=19f074db8bd85775bc0fd4cd6ec1dce8",
					"text": "超薄时尚手机 vivo x5max报价2700"
				}
			},
			{
				"id": 480,
				"text": "由于是手机答题的,图就麻烦自己找吧.",
				"document": {
					"url": "https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/3812b31bb051f8195d060655dab44aed2e73e78a.jpg",
					"text": "由于是手机答题的,图就麻烦自己找吧."
				}
			},
			{
				"id": 1083,
				"text": "墓穴盗贼手机版v1.0.5 安卓版",
				"document": {
					"url": "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.haote.com%2Fupload%2F202108%2F25%2F1629886563844021.jpg&refer=http%3A%2F%2Fimg.haote.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1632601367&t=7b5022cbbe70051c4496232c4d22be80",
					"text": "墓穴盗贼手机版v1.0.5 安卓版"
				}
			},
			{
				"id": 1409,
				"text": "陕西西安一姑娘手机失而复得后手机里却多了张陌生人照片",
				"document": {
					"url": "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fk-static.xsfaya.com%2Fuploads%2Fallimg%2F210826%2F1600414225-0.jpg&refer=http%3A%2F%2Fk-static.xsfaya.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1632598925&t=0835fc517e7866f9213a605660a39e4a",
					"text": "陕西西安一姑娘手机失而复得后手机里却多了张陌生人照片"
				}
			},
			{
				"id": 1570,
				"text": "站长聚惠:93折充手机话费,领外卖红包省钱还返现",
				"document": {
					"url": "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fupload.chinaz.com%2Fpicmap%2F202011082114471502_51.jpg&refer=http%3A%2F%2Fupload.chinaz.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1632558300&t=8479ba4619502ba82ebe78f53660e3e6",
					"text": "站长聚惠:93折充手机话费,领外卖红包省钱还返现"
				}
			},
			{
				"id": 1683,
				"text": "华为(huawei) 荣耀 畅玩6 全网通4g智能手机 双卡双待",
				"document": {
					"url": "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg14.360buyimg.com%2Fn1%2Fs450x450_jfs%2Ft8836%2F143%2F851769817%2F492015%2F40fb43ff%2F59afb6c1N55902ee8.jpg&refer=http%3A%2F%2Fimg14.360buyimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1632608080&t=8a03376e8b2a9fec175d84daf51f92b7",
					"text": "华为(huawei) 荣耀 畅玩6 全网通4g智能手机 双卡双待"
				}
			},
			{
				"id": 2593,
				"text": "通勤路上枯燥无聊试试裸眼3d手机看裸眼3d电影打3d游戏",
				"document": {
					"url": "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fnimg.ws.126.net%2F%3Furl%3Dhttp%253A%252F%252Fdingyue.ws.126.net%252Fz652h8KqHvqVBcPVVtRO5nMVmF1WbDrlbdM6zJjxR8EPW1626076070390.jpeg%26thumbnail%3D650x2147483647%26quality%3D80%26type%3Djpg&refer=http%3A%2F%2Fnimg.ws.126.net&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1632580822&t=25818d104fd4aa071f55885178ee9879",
					"text": "通勤路上枯燥无聊试试裸眼3d手机看裸眼3d电影打3d游戏"
				}
			},
			{
				"id": 2621,
				"text": "诺基亚手机产品历史回顾",
				"document": {
					"url": "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg6.cache.netease.com%2Ftech%2F2012%2F9%2F8%2F20120908102310c6462.jpg&refer=http%3A%2F%2Fimg6.cache.netease.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1632539627&t=b99fd42e16d68008942e223cea25a8dc",
					"text": "诺基亚手机产品历史回顾"
				}
			},
			{
				"id": 2674,
				"text": "迷你大容量便携小巧双入三出适用于苹果华为小米手机平板移动电源问答",
				"document": {
					"url": "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimgservice.suning.cn%2Fuimg1%2Fb2c%2Fimage%2FLapdoBWyJHaUM3IjhCogNA.jpg_200w_200h_4e&refer=http%3A%2F%2Fimgservice.suning.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1632510021&t=33be71963a9bd28a94989de30e071354",
					"text": "迷你大容量便携小巧双入三出适用于苹果华为小米手机平板移动电源问答"
				}
			}
		]
	}
}
""",
  """
{
	"code": 0,
	"msg": "Success",
	"data": {
		"useTime": 0.0685073,
		"total": 2280,
		"page": 2,
		"totalPage": 228,
		"records": [
			{
				"id": 2762,
				"text": "壁纸 夜景 1100_1390 竖版 竖屏 手机",
				"document": {
					"url": "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fa.vpimg3.com%2Fupload%2Fmerchandise%2Fpdc%2F891%2F671%2F2197269992078671891%2F1%2Flvxing-160129ySDBNXLD2-1.jpg&refer=http%3A%2F%2Fa.vpimg3.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1632542867&t=422a0c0e35795ba661a5395a156fedef",
					"text": "壁纸 夜景 1100_1390 竖版 竖屏 手机"
				}
			},
			{
				"id": 3335,
				"text": "与君歌电视剧免费手机在线完整观看完整加长版hd1080p蓝光",
				"document": {
					"url": "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwx2.sinaimg.cn%2Flarge%2F006EyYiyly4gth6r1dag2j30ti0iidi3.jpg&refer=http%3A%2F%2Fwx2.sinaimg.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1632559970&t=600d12b305de7c4dc34463c46a4a53fd",
					"text": "与君歌电视剧免费手机在线完整观看完整加长版hd1080p蓝光"
				}
			},
			{
				"id": 3527,
				"text": "华为荣耀手机换新logo了!",
				"document": {
					"url": "https://gimg2.baidu.com/image_search/src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20181026%2Ff80bc1a94a574bcbbd01c9d809fbade9.jpeg&refer=http%3A%2F%2F5b0988e595225.cdn.sohucs.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1632535031&t=9f9ab603ec57578bb0215b59fbed80fc",
					"text": "华为荣耀手机换新logo了!"
				}
			},
			{
				"id": 3762,
				"text": "当前位置:>首页>手游下载>神途手游通用秒杀挂手机版本v3.",
				"document": {
					"url": "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-img.18183.com%2Fimages%2F2021%2F07%2F19%2F6d02ae90489d769f9bb93bb236e79b94.jpg&refer=http%3A%2F%2Fc-img.18183.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1632509915&t=473b7cc066a8ce3e16c2f331ba7d7c98",
					"text": "当前位置:>首页>手游下载>神途手游通用秒杀挂手机版本v3."
				}
			},
			{
				"id": 3784,
				"text": "早晨醒来打开手机, 确诊数字还在上涨.",
				"document": {
					"url": "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Finews.gtimg.com%2Fnewsapp_match%2F0%2F11302641116%2F0.jpg&refer=http%3A%2F%2Finews.gtimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1632506049&t=7677c6766f7d927139610abdd54bd112",
					"text": "早晨醒来打开手机, 确诊数字还在上涨."
				}
			},
			{
				"id": 3860,
				"text": "8848钛金手机m4尊享版/全网通防监听防跟踪送千元礼包",
				"document": {
					"url": "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fi2.mercrt.fd.zol-img.com.cn%2Fg5%2FM00%2F01%2F0F%2FChMkJlmlM8WIYoB1AAQIXuKGpeAAAgCygMldzUABAh2242.jpg&refer=http%3A%2F%2Fi2.mercrt.fd.zol-img.com.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1632511064&t=56987e8233e464339c007ecda89a24c7",
					"text": "8848钛金手机m4尊享版/全网通防监听防跟踪送千元礼包"
				}
			},
			{
				"id": 3873,
				"text": "2021年9月手机cpu天梯图9月手机处理器天梯图",
				"document": {
					"url": "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.topber.com%2Fupload%2Fdefault%2F20210824%2Fbaef64a48e01dfabef65cf1f7dbbfb30.png&refer=http%3A%2F%2Fimg.topber.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1632506905&t=981fc99bfea24f2c33b15e8f4f1e11ac",
					"text": "2021年9月手机cpu天梯图9月手机处理器天梯图"
				}
			},
			{
				"id": 4117,
				"text": "苹果手机iphone怎么设定ios15系统的专注模式",
				"document": {
					"url": "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.3dsc.com%2Fuploadfile%2F2021%2F0811%2F20210811041146665.png&refer=http%3A%2F%2Fwww.3dsc.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1632585536&t=43a0fd3998659ed6fe46ffd632cc76b6",
					"text": "苹果手机iphone怎么设定ios15系统的专注模式"
				}
			},
			{
				"id": 4172,
				"text": "而家属刚好碰见孩子在家里脱下衣服,对着手机拍照.",
				"document": {
					"url": "https://pics1.baidu.com/feed/a9d3fd1f4134970ac01aedddf15c48cea6865d70.jpeg?token=6b7a0b7368f5e03aba203fac03bb5362",
					"text": "而家属刚好碰见孩子在家里脱下衣服,对着手机拍照."
				}
			},
			{
				"id": 4492,
				"text": "最后在附上一加5跑分图,现在是安卓手机跑分机王,把其他",
				"document": {
					"url": "https://gimg2.baidu.com/image_search/src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20170713%2Ffeaf5b2689364736a08383d64b951f5d.png&refer=http%3A%2F%2F5b0988e595225.cdn.sohucs.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1632537171&t=b4a7a5bdabd621e88208225c1adf1742",
					"text": "最后在附上一加5跑分图,现在是安卓手机跑分机王,把其他"
				}
			}
		]
	}
}
""",
];

// api的mock类，只提供查找关键词为“手机”的两页mock数据
class SearcherMock implements ASearcher {
  @override
  Future<SearchResponse> search(
    String query,
    int page, {
    int limit = 10,
  }) async {
    final responseJson =
        jsonDecode(mockJsonResponseList[page - 1]) as Map<String, dynamic>;
    return SearchResponse.fromJson(responseJson['data']);
  }
}
