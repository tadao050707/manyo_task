require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
	    visit new_task_path
		fill_in 'タスク名', with: '洗濯をする'
		fill_in '詳細', with: 'ふとんを洗濯する'
		click_on 'Create Task'
		click_link '詳細'
		expect(page).to have_content '洗濯をする'
		expect(page).to have_content 'ふとんを洗濯する'
      end
    end
  end

  describe '一覧表示機能' do
	let!(:task1) { FactoryBot.create(:task, :a) }
	let!(:task2) { FactoryBot.create(:task, :b) }
	let!(:task3) { FactoryBot.create(:task, :c) }
	before do
	  visit tasks_path
	end	
    context '一覧画面に遷移した場合' do
	  it '作成済みのタスク一覧が表示される' do
		expect(page).to have_content 'task_title_1'
		expect(page).to have_content 'task_title_2'
		expect(page).to have_content 'task_title_3'
		# expectの結果が true ならテスト成功、false なら失敗として結果が出力される
	  end
	end

	context 'タスクが作成日時の降順に並んでいる場合' do
	  it '新しいタスクが一番上に表示される' do
		get_item = all('#task_title')
		expect(get_item[0]).to have_content 'task_title_3'
		expect(get_item[1]).to have_content 'task_title_2'
		expect(get_item[2]).to have_content 'task_title_1'
	  end
	end
  end

  describe '詳細表示機能' do
    context '任意のタスク詳細画面に遷移した場合' do
      it '該当タスクの内容が表示される' do
        FactoryBot.create(:task, :a)
		visit tasks_path
		click_link '詳細'
		expect(page).to have_content 'task_title_1'
		expect(page).to have_content 'task_content_1'
      end
    end
  end
end