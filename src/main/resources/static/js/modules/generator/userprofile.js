$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'generator/userprofile/list',
        datatype: "json",
        colModel: [			
			{ label: 'uid', name: 'uid', index: 'uid', width: 50, key: true },
			{ label: '', name: 'name', index: 'name', width: 80 }, 			
			{ label: '', name: 'level', index: 'level', width: 80 }, 			
			{ label: '', name: 'exp', index: 'exp', width: 80 }, 			
			{ label: '', name: 'gold', index: 'gold', width: 80 }, 			
			{ label: '', name: 'paidgold', index: 'paidGold', width: 80 }, 			
			{ label: '', name: 'paytotal', index: 'payTotal', width: 80 }, 			
			{ label: '', name: 'parseregisterid', index: 'parseRegisterId', width: 80 }, 			
			{ label: '', name: 'gcmregisterid', index: 'gcmRegisterId', width: 80 }, 			
			{ label: '', name: 'openedpos', index: 'openedPos', width: 80 }, 			
			{ label: '', name: 'pic', index: 'pic', width: 80 }, 			
			{ label: '', name: 'picver', index: 'picVer', width: 80 }, 			
			{ label: '', name: 'country', index: 'country', width: 80 }, 			
			{ label: '', name: 'allianceid', index: 'allianceId', width: 80 }, 			
			{ label: '', name: 'chnamecount', index: 'chNameCount', width: 80 }, 			
			{ label: '', name: 'worldpoint', index: 'worldPoint', width: 80 }, 			
			{ label: '', name: 'deviceid', index: 'deviceId', width: 80 }, 			
			{ label: '', name: 'gaid', index: 'gaid', width: 80 }, 			
			{ label: '', name: 'platform', index: 'platform', width: 80 }, 			
			{ label: '', name: 'pf', index: 'pf', width: 80 }, 			
			{ label: '', name: 'lang', index: 'lang', width: 80 }, 			
			{ label: '', name: 'mt', index: 'mt', width: 80 }, 			
			{ label: '', name: 'appversion', index: 'appVersion', width: 80 }, 			
			{ label: '', name: 'gmflag', index: 'gmFlag', width: 80 }, 			
			{ label: '', name: 'regtime', index: 'regTime', width: 80 }, 			
			{ label: '', name: 'offlinetime', index: 'offLineTime', width: 80 }, 			
			{ label: '', name: 'bantime', index: 'banTime', width: 80 }, 			
			{ label: '', name: 'chatbantime', index: 'chatBanTime', width: 80 }, 			
			{ label: '', name: 'bangmname', index: 'banGMName', width: 80 }, 			
			{ label: '', name: 'noticebantime', index: 'noticeBanTime', width: 80 }, 			
			{ label: '', name: 'lastonlinetime', index: 'lastOnlineTime', width: 80 }, 			
			{ label: '', name: 'gmail', index: 'gmail', width: 80 }, 			
			{ label: '', name: 'serverid', index: 'serverId', width: 80 }, 			
			{ label: '', name: 'crossfightsrcserverid', index: 'crossFightSrcServerId', width: 80 }, 			
			{ label: '', name: 'lastmodgoldgettime', index: 'lastModGoldGetTime', width: 80 }, 			
			{ label: '', name: 'modgoldgettimeinterval', index: 'modGoldGetTimeInterval', width: 80 }, 			
			{ label: '', name: 'modgoldamount', index: 'modGoldAmount', width: 80 }, 			
			{ label: '', name: 'betrainingmodtime', index: 'beTrainingModTime', width: 80 }, 			
			{ label: '', name: 'guidestep', index: 'guideStep', width: 80 }, 			
			{ label: '', name: 'payriskfactor', index: 'payRiskFactor', width: 80 }, 			
			{ label: '', name: 'phonedevice', index: 'phoneDevice', width: 80 }, 			
			{ label: '', name: 'crystal', index: 'crystal', width: 80 }, 			
			{ label: '', name: 'flag', index: 'flag', width: 80 }, 			
			{ label: '', name: 'taskid', index: 'taskId', width: 80 }, 			
			{ label: '', name: 'firstdragoneggfetchtime', index: 'firstDragonEggFetchTime', width: 80 }, 			
			{ label: '', name: 'uploadpiccnt', index: 'uploadPicCnt', width: 80 }, 			
			{ label: '', name: 'regversion', index: 'regVersion', width: 80 }, 			
			{ label: '', name: 'alsignrewardlog', index: 'alsignrewardlog', width: 80 }, 			
			{ label: '', name: 'allianceoffical', index: 'allianceOffical', width: 80 }, 			
			{ label: '', name: 'contributerewardlog', index: 'contributeRewardLog', width: 80 }, 			
			{ label: '', name: 'alivedays', index: 'alivedays', width: 80 }, 			
			{ label: '', name: 'totalscore', index: 'totalScore', width: 80 }, 			
			{ label: '', name: 'alsignts', index: 'alsignts', width: 80 }, 			
			{ label: '', name: 'krakenawardid', index: 'krakenAwardId', width: 80 }, 			
			{ label: '', name: 'krakennexttime', index: 'krakenNextTime', width: 80 }, 			
			{ label: '', name: 'aduserflag', index: 'adUserFlag', width: 80 }, 			
			{ label: '', name: 'dragondata', index: 'dragonData', width: 80 }, 			
			{ label: '', name: 'krakenquality', index: 'krakenQuality', width: 80 }, 			
			{ label: '', name: 'secretaryflag', index: 'secretaryFlag', width: 80 }, 			
			{ label: '', name: 'energysenddata', index: 'energySendData', width: 80 }, 			
			{ label: '', name: 'mysteriousdata', index: 'mysteriousData', width: 80 }			
        ],
		viewrecords: true,
        height: 385,
        rowNum: 10,
		rowList : [10,30,50],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader : {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames : {
            page:"page", 
            rows:"limit", 
            order: "order"
        },
        gridComplete:function(){
        	//隐藏grid底部滚动条
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 
        }
    });
});

var vm = new Vue({
	el:'#rrapp',
	data:{
		showList: true,
		title: null,
		userprofile: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.userprofile = {};
		},
		update: function (event) {
			var uid = getSelectedRow();
			if(uid == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            
            vm.getInfo(uid)
		},
		saveOrUpdate: function (event) {
			var url = vm.userprofile.uid == null ? "generator/userprofile/save" : "generator/userprofile/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.userprofile),
			    success: function(r){
			    	if(r.code === 0){
						alert('操作成功', function(index){
							vm.reload();
						});
					}else{
						alert(r.msg);
					}
				}
			});
		},
		del: function (event) {
			var uids = getSelectedRows();
			if(uids == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "generator/userprofile/delete",
                    contentType: "application/json",
				    data: JSON.stringify(uids),
				    success: function(r){
						if(r.code == 0){
							alert('操作成功', function(index){
								$("#jqGrid").trigger("reloadGrid");
							});
						}else{
							alert(r.msg);
						}
					}
				});
			});
		},
		getInfo: function(uid){
			$.get(baseURL + "generator/userprofile/info/"+uid, function(r){
                vm.userprofile = r.userprofile;
            });
		},
		reload: function (event) {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
                page:page
            }).trigger("reloadGrid");
		}
	}
});