public interface IGameState
{
    void Enter(Game game);
    void Update(Game game);
    void Exit(Game game);
}