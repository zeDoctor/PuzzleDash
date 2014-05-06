module game;
import grid;
import core, graphics, components, utility;
import gl3n.linalg, gl3n.math;

class Game : DGame
{
    Camera cam;
    
    override void onInitialize()
    {

        logInfo( "Initializing TestGame..." );

        Input.addKeyDownEvent( Keyboard.Delete, ( uint kc ) { currentState = EngineState.Quit; } );
        Input.addKeyDownEvent( Keyboard.F5, ( uint kc ) { currentState = EngineState.Reset; } );
        Input.addKeyDownEvent( Keyboard.MouseLeft, ( kc ) { if( auto obj = Input.mouseObject ) logInfo( "Clicked on ", obj.name ); } );

        activeScene = new Scene;
        activeScene.loadObjects( "" );
        activeScene.camera = activeScene[ "TestCamera" ].camera;

        //scheduleTimedTask( { logInfo( "Executing: ", Time.totalTime ); }, 250.msecs );
		int[][int] thingy;
		thingy[3] = [ 1, 2, 3 ];
		logDebug( thingy );
		thingy[3] ~= 7;
		thingy[3][1] = 4;
		logDebug( thingy );
		logDebug( thingy[3] );
    }

    override void onUpdate()
    {
        //ui.update();
    }
    
    override void onDraw()
    {
        //ui.draw();
    }

    override void onShutdown()
    {
        logInfo( "Shutting down..." );
        foreach( obj; activeScene.objects )
            obj.shutdown();
        activeScene.clear();
        activeScene = null;
    }

    override void onSaveState()
    {
        logInfo( "Resetting..." );
    }
}
