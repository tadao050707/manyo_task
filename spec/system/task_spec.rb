require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
				visit new_task_path
				fill_in 'タスク名', with: '洗濯をする'
				fill_in '詳細', with: 'ふとんを選択する'
				click_on 'Create Task'
				click_link '詳細'
				expect(page).to have_content '洗濯をする'
				expect(page).to have_content 'ふとんを選択する'
      end
    end
  end

    describe '一覧表示機能' do
		context '一覧画面に遷移した場合' do
			it '作成済みのタスク一覧が表示される' do
				# テストで使用するためのtaskを作成。titleの値をオーバーライド。
				task = FactoryBot.create(:task, title: 'task_1')
				task = FactoryBot.create(:task, title: 'task_2')
				task = FactoryBot.create(:task, title: 'task_3')
				# タスク一覧ページに遷移
				visit tasks_path
				# visitした（遷移した）page（タスク一覧ページ）に「task」という文字列が
				# have_contentされているか（含まれているか）ということをexpectする（確認・期待する）
				expect(page).to have_content 'task_1'
				expect(page).to have_content 'task_2'
				expect(page).to have_content 'task_3'
				# expectの結果が true ならテスト成功、false なら失敗として結果が出力される
			end
		end
	end

  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
				FactoryBot.create(:task)
				visit tasks_path
				click_link '詳細'
				expect(page).to have_content 'test_title'
				expect(page).to have_content 'test_content'
       end
     end
  end
end