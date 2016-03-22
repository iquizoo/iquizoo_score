function setting = itemSet(sheets)
%Do items setting.

variables = cell(size(sheets));
QID = nan(size(sheets));
Alternative = zeros(size(sheets));
anafuncs = cell(size(sheets));
anavars = cell(size(sheets));
cates = zeros(size(sheets));
nSheets = length(sheets);
for i = 1:nSheets
    initialVars = who;
    %For the preprocessing step.
    switch sheets{i}
        case {...
                '快速减法', ...
                '速算师', ...
                }
            Vars = {'uuid', 'pid', 'name', 'gender', 'school', 'grade', 'qrecord', 'RT', 'ACC', 'score'};
            questID = 12;
        case '思维转换'
            Vars = {'uuid', 'pid', 'name', 'gender', 'school', 'grade', 'qrecord', 'score'};
            questID = 1;
        case '联系记忆'
            Vars = {'uuid', 'pid', 'name', 'gender', 'school', 'grade', 'qrecord', 'score'};
            questID = 2;
        case { ...
                '抵制诱惑' ...
                '水果忍者', ...
                }
            Vars = {'uuid', 'pid', 'name', 'gender', 'school', 'grade', 'qrecord', 'RT', 'ACC', 'score'};
            questID = 3;
        case {...
                '反应速度 儿童版(月亮)', ...
                '分辨速度儿童版(月亮向右、太阳不操作)', ...
                '选择速度儿童版（月亮向左，太阳向右）', ...
                '分辨速度(红色向右、蓝色不操作)', ...
                '选择速度', ...
                '分辨速度(蓝色向左，红色不操作)', ...
                '反应速度（蓝色）', ...
                '反应速度儿童版（太阳）', ...
                '分辨速度儿童版(太阳向右、月亮不操作)',...
                }
            Vars = {'uuid', 'pid', 'name', 'gender', 'school', 'grade', 'qrecord', 'RT', 'ACC', 'score'};
            questID = 8;
        case '方向达人'
            Vars = {'uuid', 'pid', 'name', 'gender', 'school', 'grade', 'qrecord', 'score'};
            questID = 9;
        case '捉虫'
            Vars = {'uuid', 'pid', 'name', 'gender', 'school', 'grade', 'qrecord', 'score'};
            questID = 19;
        case {...
                '顺背数', ...
                '倒背数', ...
                }
            Vars = {'uuid', 'pid', 'name', 'gender', 'school', 'grade', 'qrecord', 'score'};
            questID = 10; % An alternative choice of question ID.
            Alt = 14;
        case {...
                '顺背数新', ...
                '倒背数新', ...
                }
            Vars = {'uuid', 'pid', 'name', 'gender', 'school', 'grade', 'qrecord', 'score'};
            questID = 14;
        case { ...
                '数字魔法师初级', ...
                '数字魔法师中级', ...
                }
            Vars = {'uuid', 'pid', 'name', 'gender', 'school', 'grade', 'qrecord', 'RT', 'ACC', 'score'};
            questID = 4;
        case {...
                '分配注意初级', ...
                '分配注意中级', ...
                }
            Vars = {'uuid', 'pid', 'name', 'gender', 'school', 'grade', 'qrecordl', 'qrecordr', 'score'};
            questID = 15;
            Alt = 11;
        case {...
                '图片记忆', ...
                '言语记忆', ...
                }
            Vars = {'uuid', 'pid', 'name', 'gender', 'school', 'grade', 'qrecord', 'score'};
            questID = 16;
        case '语义记忆'
            Vars = {'uuid', 'pid', 'name', 'gender', 'school', 'grade', 'qrecordlearn', 'qrecordtest', 'score'};
            questID = 17;
            Alt = 18;
        case '超级秒表'
            Vars = {'uuid', 'pid', 'name', 'gender', 'school', 'grade', 'qrecord', 'RT', 'ACC', 'score'};
            questID = 5;
        case '面包大师'
            Vars = {'uuid', 'pid', 'name', 'gender', 'school', 'grade', 'qrecord', 'RT', 'ACC', 'score'};
            questID = 6;
        case '反应速度（红色）'
            Vars = {'uuid', 'pid', 'name', 'gender', 'school', 'grade', 'qrecord', 'score'};
            questID = 8;
        case '位置记忆'
            Vars = {'uuid', 'pid', 'name', 'gender', 'school', 'grade', 'qrecord', 'score'};
            questID = 13;
        case {...
                '颜色达人（字义）', ...
                '颜色达人（字色）', ...
                }
            Vars = {'uuid', 'pid', 'name', 'gender', 'school', 'grade', 'qrecord', 'RT', 'ACC', 'score', 'sdk'};
            questID = 7;
    end
    if ~exist('Alt', 'var')
        Alt = 0;
    end
    variables{i} = Vars;
    QID(i) = questID;
    Alternative(i) = Alt;
    anafuncs{i} = anafunc;
    anavars{i} = anavar;
    cates(i) = cate;
    clearvars('-except', initialVars{:})
end
setting = table(sheets, variables, QID, Alternative, anafuncs, anavars, cates);
