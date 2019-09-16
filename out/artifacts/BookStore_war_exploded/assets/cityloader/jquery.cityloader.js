/**
 * 省市区三级联动 (基于jQuery)
 * Charset:UTF-8
 * Author:XiaZengming
 * Date:2016年8月28日00:16:06
 * Version:2.0
 * http://www.zhenzhigu.com
 * 代码中用到动态加载技术，需要在http协议下才能正常工作
 * ------------------------
 * url:数据文件，默认当前js文件旁边的data.cn.json
 * prov:默认省份
 * city:默认城市
 * dist:默认地区
 * nodata:没有数据时的处理('none':不显示，'hidden':不显示但占用原位置)
 * ------------------------
 * 给元素添加cityloader属性后，会自动加载
 * 可以在select元素中设置cityloader-value属性作为默认值
 * ------------------------
 */
(function($){
	var js=document.scripts;
	var path=js[js.length-1].src.substring(0,js[js.length-1].src.lastIndexOf("/")+1);
	$.fn.cityloader=function(settings){
		if(this.length==0){return;};

		for(var i=this.find("select").length;i<3;i++){
			this.append("<select></select>");
		}
		
		var city_data;
		var st_prov = this.find("[cityloader-prov]").eq(0);
		var st_city = this.find("[cityloader-city]").eq(0);
		var st_dist = this.find("[cityloader-dist]").eq(0);
		if(st_prov.length==0)st_prov = this.find("select").not("[cityloader-city],[cityloader-dist]").eq(0).attr("cityloader-prov","");
		if(st_city.length==0)st_city = this.find("select").not("[cityloader-prov],[cityloader-dist]").eq(0).attr("cityloader-city","");
		if(st_dist.length==0)st_dist = this.find("select").not("[cityloader-city],[cityloader-prov]").eq(0).attr("cityloader-dist","");
		settings.url=settings.url||this.attr("cityloader-url")||path+"data.cn.json";
		settings.prov=settings.prov||st_prov.attr("cityloader-value");
		settings.city=settings.city||st_city.attr("cityloader-value");
		settings.dist=settings.dist||st_dist.attr("cityloader-value");
		settings.nodata=settings.nodata||this.attr("cityloader-nodata");
		//默认设置
		settings=$.extend({
			url:null,
			prov:null,
			city:null,
			dist:null,
			nodata:null
		},settings);
		
		var createOption = function(key,value){
			return $("<option></option>").val(value).text(value).attr("clti",key);
		};
		st_prov[0].next=st_city;st_city[0].next=st_dist;
		var init = function(){
			
			$.each(city_data['p'],function(key,value){
				st_prov.append(createOption(key,value));
			});
			
			var changeHandler = function(){
				var pid = $(this).find("option:selected").attr("clti");
				var next = $(this.next);
				next.empty().attr("disabled",true);
				if( !city_data[pid]){
					if(settings.nodata=='none'){
						next.css("display","none");
					}else if(settings.nodata=="hidden"){
						next.css("visibility","hidden");
					};
					next.change();
					return;
				}
				$.each(city_data[pid],function(key,value){
					next.append(createOption(pid+"_"+key,value));
				});
				next.attr("disabled",false).css({"display":"","visibility":""}).change();
			};
			$(st_dist).change(changeHandler);
			$(st_city).change(changeHandler);
			$(st_prov).change(changeHandler).change();
			//设置默认值
			for(var i=0;i<=2;i++){
				var dv = [settings.prov,settings.city,settings.dist];
				if(dv[i]){[st_prov,st_city,st_dist][i].val(dv[i]).change();}else break;
			}
			
		};
		if(typeof(settings.url)==='string'){
			if(settings.url.match(/^[\s]{0,}\{[\s\S]{0,}\}[\s]{0,}$/)){
				city_data = JSON.parse(settings.url);
				init();return;
			}
			$.getJSON(settings.url,function(json){
				city_data = json;
				init();
			});
		}else if(typeof(settings.url)==='object'){
			city_data = settings.url;
			init();
		}
		

	};
	
	$(function(){
		$.each($("[cityloader]"),function(n,el){
			$(el).cityloader({});
		});
	});
	
})(jQuery);