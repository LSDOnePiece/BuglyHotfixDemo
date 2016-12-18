
require('ViewController')

defineClass("ViewController",{
	///实例方法
	tableView_didSelectRowAtIndexPath: function(tableView,indexPath){

		var row = indexPath.row();
		if (row < self.dataArray().count()) {

		var name = self.dataArray().objectAtIndex(row);
		console.log(name);
		}
    }
},

)
