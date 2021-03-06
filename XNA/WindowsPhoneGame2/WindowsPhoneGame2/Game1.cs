using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Audio;
using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.GamerServices;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using Microsoft.Xna.Framework.Input.Touch;
using Microsoft.Xna.Framework.Media;

namespace WindowsPhoneGame2
{
	/// <summary>
	/// 这是游戏的主类型
	/// </summary>
	public class Game1 : Microsoft.Xna.Framework.Game
	{
		GraphicsDeviceManager graphics;
		SpriteBatch spriteBatch;
		Texture2D texture;
		Texture2D textureTransprent;
		Vector2 pos1 = Vector2.Zero;
		Vector2 pos2 = Vector2.Zero;
		float speed1 = 2f;
		float speed2 = 3f;

		public Game1()
		{
			graphics = new GraphicsDeviceManager(this);
			Content.RootDirectory = "Content";

			// Windows Phone 的默认帧速率为 30 fps。
			TargetElapsedTime = TimeSpan.FromTicks(333333);

			// 延长锁定时的电池寿命。
			InactiveSleepTime = TimeSpan.FromSeconds(1);
		}

		/// <summary>
		/// 允许游戏在开始运行之前执行其所需的任何初始化。
		/// 游戏能够在此时查询任何所需服务并加载任何非图形
		/// 相关的内容。调用 base.Initialize 将枚举所有组件
		/// 并对其进行初始化。 
		/// </summary>
		protected override void Initialize()
		{
			// TODO: 在此处添加初始化逻辑

			base.Initialize();
		}

		/// <summary>
		/// 对于每个游戏会调用一次 LoadContent，
		/// 用于加载所有内容。
		/// </summary>
		protected override void LoadContent()
		{
			// 创建新的 SpriteBatch，可将其用于绘制纹理。
			spriteBatch = new SpriteBatch(GraphicsDevice);

			// TODO: 在此处使用 this.Content 加载游戏内容
			texture = Content.Load<Texture2D>(@"Images/logo");
			textureTransprent = Content.Load <Texture2D>(@"Images/logo_trans");
		}

		/// <summary>
		/// 对于每个游戏会调用一次 UnloadContent，
		/// 用于取消加载所有内容。
		/// </summary>
		protected override void UnloadContent()
		{
			// TODO: 在此处取消加载任何非 ContentManager 内容
		}

		/// <summary>
		/// 允许游戏运行逻辑，例如更新全部内容、
		/// 检查冲突、收集输入信息以及播放音频。
		/// </summary>
		/// <param name="gameTime">提供计时值的快照。</param>
		protected override void Update(GameTime gameTime)
		{
			// 允许游戏退出
			if (GamePad.GetState(PlayerIndex.One).Buttons.Back == ButtonState.Pressed)
				this.Exit();

			// TODO: 在此处添加更新逻辑
			pos1.X += speed1;
			if (pos1.X > Window.ClientBounds.Width - texture.Width || pos1.X < 0)
			{
				speed1 *= -1;
			}

			pos2.Y += speed2;
			if (pos2.Y > Window.ClientBounds.Height - textureTransprent.Height || pos2.Y < 0)
			{
				speed2 *= -1;
			}

			base.Update(gameTime);
		}

		/// <summary>
		/// 当游戏该进行自我绘制时调用此项。
		/// </summary>
		/// <param name="gameTime">提供计时值的快照。</param>
		protected override void Draw(GameTime gameTime)
		{
			GraphicsDevice.Clear(Color.CornflowerBlue);

			// TODO: 在此处添加绘图代码
			spriteBatch.Begin(SpriteSortMode.FrontToBack, BlendState.AlphaBlend);
			spriteBatch.Draw(texture,
				pos1,
				null,
				Color.White,
				0,
				Vector2.Zero,
				1,
				SpriteEffects.None,
				0);
			spriteBatch.Draw(textureTransprent,
				pos2,
				null,
				Color.White,
				0,
				Vector2.Zero,
				1,
				SpriteEffects.None, 
				1);
			spriteBatch.End();

			base.Draw(gameTime);
		}
	}
}
