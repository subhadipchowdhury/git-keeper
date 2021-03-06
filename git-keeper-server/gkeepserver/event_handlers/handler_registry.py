# Copyright 2016 Nathan Sommer and Ben Coleman
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


"""Provides a dictionary which maps event type strings to event handler
classes. Pass event_handlers_by_type to a LogEventParserThread constructor."""


from gkeepserver.event_handlers.submission_handler import SubmissionHandler
from gkeepserver.event_handlers.upload_handler import UploadHandler


event_handlers_by_type = {
    'SUBMISSION': SubmissionHandler,
    'UPLOAD': UploadHandler
}
