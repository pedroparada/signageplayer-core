package
{
	import mx.events.FlexEvent;
	import spark.components.NavigatorContent;
	
	public class NavigatorContentEx extends NavigatorContent
	{
		protected var m_autoDispose:Boolean = true;
		protected var m_disposed:Boolean = false;
		
		public function NavigatorContentEx()
		{
			super();
		}
		
		protected override function createChildren():void
		{
			super.createChildren();
			if (m_autoDispose)
				addEventListener(FlexEvent.REMOVE, onRemove);
		}
		
		private function onRemove(event:FlexEvent):void
		{
			dispose();
		}
		
		public function dispose():void
		{
			if (m_disposed==false)
			{
				m_disposed = true;
				if (m_autoDispose)
				{
					removeEventListener(FlexEvent.REMOVE, onDispose);
				}
				onDispose();
			}
		}
		
		protected function onDispose():void
		{
			removeAllElements();
		}		
	}
}